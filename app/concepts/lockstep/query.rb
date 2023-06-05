class Lockstep::Query
  def initialize(klass)
    @klass = klass
  end

  def model
    @klass
  end

  # Clone is used as return object as it messes with the OR query in situations like these
  #   unscoped = Lockstep::Connection.unscoped
  #   unscoped.where(a: 1).or(unscoped.where(b: 1))
  #   both the where conditions in the above scenario is modifying the same object causing stack-overflow
  def clone
    c = Lockstep::Query.new(@klass)
    c.criteria.deep_merge!(criteria.deep_dup)
    c
  end

  def with_clone(&block)
    c = clone
    c.instance_exec(&block)
    c
  end

  def criteria
    @criteria ||= { conditions: [] }
  end

  def or(query)
    with_clone do
      criteria[:conditions] << { type: 'or', query: query }
    end
  end

  def none
    with_clone do
      criteria[:none] = true
    end
  end

  def where(args)
    if args.is_a?(Hash)
      args.each do |_k, v|
        return none if v.is_a?(Array) and v.blank?
      end
    end

    with_clone do
      criteria[:conditions] << convert_arg(args)
    end
  end

  def additional_query_params(args)
    with_clone do
      criteria[:additional_query_params] ||= args
    end
  end

  def convert_arg(arg)
    return arg.to_pointer if arg.is_a?(Lockstep::ApiRecord)
    return Lockstep::ApiRecord.to_date_object(arg) if arg.is_a?(Time) || arg.is_a?(Date)

    if arg.is_a?(Hash)
      arg.keys.each do |key|
        @klass.valid_attribute?(key, raise_exception: true)
      end
      return arg.update(arg) { |_key, inner_arg| convert_arg(inner_arg) }
    end

    arg
  end

  def limit(limit)
    with_clone do
      # If > 1000, set chunking, because large queries over 1000 need it with Parse
      # criteria[:chunk] = 1000 if limit > 1000
      criteria[:limit] = limit
    end
  end

  def page(page_number)
    with_clone do
      criteria[:page_number] = page_number
    end
  end

  def include_object(*objects)
    with_clone do
      criteria[:include] ||= []
      criteria[:include] += objects
      criteria[:include].uniq!
    end
  end

  def in_batches(batch_size: 100)
    return if criteria[:none] || batch_size.zero?
    return unless block_given?

    params = build_params

    page = criteria[:page] || 0
    limit = criteria[:limit] || 0
    fetched_records_count = 0

    loop do
      params[:pageNumber] = page
      params[:pageSize] = limit.positive? ? [limit - fetched_records_count, batch_size].min : batch_size
      break if params[:pageSize].zero?

      results = get_results(params)
      break unless results.present?

      yield results

      fetched_records_count += results.size
      break if limit.positive? && fetched_records_count >= limit

      page += 1
    end

    nil
  end

  def with_count(value)
    with_clone do
      criteria[:with_count] = value
    end
  end

  # attr: {customer_name: :desc}
  def order(*attr)
    with_clone do
      criteria[:order] ||= []
      attr.each do |item|
        if item.is_a?(Hash)
          item.each do |k, v|
            criteria[:order] << "#{k.to_s.camelize.upcase} #{v}"
          end
        elsif item.is_a?(String)
          criteria[:order] << item
        end
      end
    end
  end

  # attr: {customer_name: :desc}
  def reorder(attr)
    with_clone do
      criteria[:order] = []
      order(attr)
    end
  end

  # Divides the query into multiple chunks if you're running into RestClient::BadRequest errors.
  def chunk(count = 100)
    with_clone do
      criteria[:chunk] = count
    end
  end

  # def related_to(obj, key)
  #   query = { "$relatedTo" => { "object" => obj.to_pointer, "key" => key } }
  #   criteria[:conditions].merge!(query)
  #   clone
  # end

  def build_filter
    filter = ''
    criteria[:conditions].each do |condition|
      if condition.is_a?(Hash)
        if condition[:type] == 'or'
          filter = build_filter_condition(filter, 'OR', condition[:query].build_filter)
        else
          condition.each do |key, value|
            filter = build_filter_condition(filter, 'AND', build_filter_query(key, value))
          end
        end
      elsif condition.is_a?(String)
        filter = build_filter_condition(filter, 'AND', condition)
      end
    end
    filter
  end

  def build_filter_condition(filter, merge_predicate, condition)
    if filter.present?
      filter = "(#{filter}) #{merge_predicate} (#{condition})"
    else
      filter += condition
    end
    filter
  end

  PREDICATES = {
    _not_eq: 'NE',
    _eq: 'EQ',
    _gteq: 'GE',
    _gt: 'GT',
    _lteq: 'LE',
    _lt: 'LT',
    _in: 'IN',
    _contains: 'CONTAINS',
    _starts_with: 'STARTSWITH',
    _ends_with: 'ENDSWITH',
    _is: 'IS'
  }.with_indifferent_access

  def build_filter_query(key, value)
    key = key.to_s unless key.is_a?(String)
    predicate = 'eq' # default
    PREDICATES.each do |k, p|
      next unless key.ends_with?(k)

      key = key.gsub(k, '')
      predicate = p
      break
    end

    # Build value
    if value.is_a?(Array)
      value = "(#{value.map { |v| v.is_a?(String) ? "'#{v}'" : v }.join(',')})"
      predicate = 'in' if predicate == 'eq'
    elsif value.is_a?(String) and !['NULL', 'NOT NULL'].include?(value)
      value = "'#{value}'"
    elsif value.nil?
      predicate = 'IS' if predicate == 'eq'
      value = 'NULL'
    end

    "#{key.camelize(:lower)} #{predicate} #{value}"
  end

  def build_params
    params = {}
    params.merge!({ filter: build_filter }) if criteria[:conditions]
    # Lockstep Platform API does not support a page size of 1
    params.merge!({ pageSize: (criteria[:limit] == 1 ? 2 : criteria[:limit]) }) if criteria[:limit]
    params.merge!({ pageNumber: criteria[:page_number] }) if criteria[:page_number]
    params.merge!({ include: criteria[:include].join(',') }) if criteria[:include]
    params.merge!({ order: criteria[:order].join(',') }) if criteria[:order]
    params.merge!({ pageSize: 2 }) if criteria[:count]
    params.merge!(criteria[:additional_query_params]) if criteria[:additional_query_params]
    params.reject! { |_k, v| v.blank? }
    params
  end

  def execute
    return [] if criteria[:none]

    # This code automatically adds all related objects
    #
    # if @klass.has_many_relations
    #   relations = @klass.has_many_relations.select {|k, val| val[:included]}.keys.map { |relation| relation.to_s }
    #   include_object(*relations)
    # end

    params = build_params

    return chunk_results(params) if criteria[:chunk]

    get_results(params)
  end

  def get_results(params = {})
    resp = @klass.resource.get(@klass.query_path, params: params)

    return [] if %w[404].include?(resp.code.to_s)
    # TODO: handle non 200 response code. Throwing an exception for now
    raise StandardError, "#{resp.code} error while fetching: #{resp.body}" unless %w[201
                                                                                     200].include?(resp.code.to_s)

    parsed_response = JSON.parse(resp.body)

    if criteria[:count]
      raise StandardError, "Count is not supported for #{@klass}" if parsed_response.is_a?(Array)

      results = parsed_response['totalCount']
      results.to_i
    else
      results = parsed_response.is_a?(Array) ? parsed_response : parsed_response['records']
      return [] if results.blank?

      results = results[0..(criteria[:limit] - 1)] if criteria[:limit]
      records = get_relation_objects(results.map do |r|
        # Convert camelcase to snake-case
        r = r.transform_keys { |key| key.underscore }
        @klass.model_name.to_s.constantize.new(r, false)
      end)

      if criteria[:with_count]
        [records, parsed_response['totalCount']]
      else
        records
      end
    end
  end

  def get_relation_objects(objects)
    return objects if criteria[:include].blank?

    included_objects = criteria[:include].map { |item| item.to_s.downcase }

    if @klass.has_many_relations
      objects.each do |item|
        @klass.has_many_relations.each do |relation, relation_config|
          next unless included_objects.include?(relation.to_s.downcase)

          if !item.attributes.has_key?(relation.to_s)
            item.attributes[relation.to_s] =
              Lockstep::RelationArray.new(@klass, [], relation, relation_config[:class_name])
          elsif !item.attributes[relation].is_a?(Lockstep::RelationArray)
            item.attributes[relation.to_s] =
              Lockstep::RelationArray.new(@klass, item.attributes[relation], relation, relation_config[:class_name])
          end
        end
      end
    end

    objects.each do |item|
      item.attributes.each do |key, value|
        if value.is_a?(Array)
          relation = @klass.has_many_relations[key]
          next if relation.blank? or !included_objects.include?(key.to_s.downcase)

          value.each do |relation_hash|
            relation_obj = turn_relation_hash_into_object(relation, relation_hash)
            value[value.index(relation_hash)] = relation_obj
          end
        elsif value.is_a?(Hash)
          relation = @klass.belongs_to_relations[key]
          next if relation.blank?

          relation_hash = value
          relation_obj = turn_relation_hash_into_object(relation, relation_hash)
          item.attributes[key] = relation_obj
        end
      end
    end
    objects
  end

  def chunk_results(params = {})
    page = criteria[:page] || 0
    limit = criteria[:limit] || 0
    # completed = false
    records = []
    loop do
      params[:pageNumber] = page
      params[:pageSize] = limit.positive? ? [limit - records.size, criteria[:chunk]].min : criteria[:chunk]
      break if params[:pageSize].zero?

      results = get_results(params)
      break unless results.present?

      records += results
      break if limit.positive? && records.size >= limit

      page += 1
    end

    records.uniq(&:attributes)
  end

  def first
    limit(1)
    execute.first
  end

  def all
    execute
  end

  def count
    criteria[:count] = true
    execute
  end

  # Find a Lockstep::ApiRecord object by ID
  #
  # @param [String] id the ID of the Parse object you want to find.
  # @return [Lockstep::ApiRecord] an object that subclasses Lockstep::ApiRecord.
  def find(id)
    raise Lockstep::Exceptions::RecordNotFound, "Couldn't find #{name} without an ID" if id.blank?

    record = where(@klass.id_ref => id).first
    raise Lockstep::Exceptions::RecordNotFound, "Couldn't find #{name} with id: #{id}" if record.blank?

    record
  end

  def method_missing(meth, *args, &block)
    method_name = method_name.to_s
    if method_name.start_with?('find_by_')
      attrib = method_name.gsub(/^find_by_/, '')
      finder_name = "find_all_by_#{attrib}"

      define_singleton_method(finder_name) do |target_value|
        where({ attrib.to_sym => target_value }).first
      end

      send(finder_name, args[0])
    elsif method_name.start_with?('find_all_by_')
      attrib = method_name.gsub(/^find_all_by_/, '')
      finder_name = "find_all_by_#{attrib}"

      define_singleton_method(finder_name) do |target_value|
        where({ attrib.to_sym => target_value }).all
      end

      send(finder_name, args[0])
    end

    if @klass.scopes[meth].present?
      instance_exec(*args, &@klass.scopes[meth])
    elsif Array.method_defined?(meth)
      all.send(meth, *args, &block)
    else
      super
    end
  end

  def respond_to?(meth)
    if Array.method_defined?(meth)
      true
    else
      super
    end
  end

  def unscoped
    Lockstep::Query.new(@klass)
  end

  private

  def turn_relation_hash_into_object(relation, hash)
    return nil if hash.nil?

    relation_klass = relation[:class_name].to_s.constantize
    relation_object = relation_klass.new
    hash.each do |key, value|
      class_name_in_a_hash = false
      if value.is_a?(Array)
        value.each do |item|
          if item and item.is_a?(Hash)
            class_name_in_a_hash = true if relation_klass.has_many_relations[key].present?
            break
          end
        end
      end

      if value.is_a?(Array) and class_name_in_a_hash
        value.each do |object_in_array|
          fresh_object = turn_relation_hash_into_object(relation_klass.has_many_relations[key][:class_name],
                                                        object_in_array)
          value[value.index(object_in_array)] = fresh_object
        end
        # Convert key from camelcase to snake-case
        relation_object.attributes[key.underscore] = value
      elsif value.is_a?(Hash) and relation_klass.belongs_to_relations[key].present?
        # Convert key from camelcase to snake-case
        relation_object.attributes[key.underscore] =
          turn_relation_hash_into_object(relation_klass.belongs_to_relations[key][:class_name], value)
      elsif key.to_s != '__type' and key.to_s != 'className'
        relation_object.attributes[key.underscore] = value
      end
      # Convert key from camelcase to snake-case
    end

    relation_object
  end
end
