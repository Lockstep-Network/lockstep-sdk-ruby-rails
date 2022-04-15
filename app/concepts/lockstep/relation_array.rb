class Lockstep::RelationArray < Array
  attr_accessor :delegate, :key, :class_name

  def initialize(delegate, items, key, class_name)
    super(items)
    self.delegate = delegate
    self.key = key
    self.class_name = class_name

    class_eval do
      define_method("#{key}_ids") do
        each.map { |item| item.id }
      end
    end
  end

  def create(attributes_hash = {})
    object = new(attributes_hash)
    return false unless object.save

    object
  end

  def new(attributes_hash = {})
    # Assign the parent records primary_key to the foreign_key of the association
    relation_config = delegate.class.lockstep_has_many_relations[key]
    foreign_key = relation_config[:foreign_key]
    primary_key = relation_config[:primary_key]
    attributes_hash[foreign_key] = delegate.send(primary_key)
    if relation_config[:polymorphic]
      polymorphic_config = Lockstep::RelationArray.has_many_polymorphic_attributes(self, relation_config[:polymorphic])
      attributes_hash.merge!(polymorphic_config) if polymorphic_config.is_a?(Hash)
    end
    object = self.class_name.constantize.new(attributes_hash)
    self.push object

    object
  end

  # @has_many_associations polymorphic properties builder.
  # Polymorphic properties is used to further scope down the has_many association while querying or creating
  #
  def self.has_many_polymorphic_attributes(record, polymorphic_config)
    return polymorphic_config if polymorphic_config.is_a?(Hash)
    return record.instance_eval record, &polymorphic_config if polymorphic_config.is_a?(Proc)

    nil
  end

  def <<(object)
    if object.is_a? Hash
      create(object)
      return object
    end

    raise Exception.new("This relation only stores objects of type #{class_name.to_s.constantize}") if !object.is_a? class_name.to_s.constantize

    super(object)
    object
  end

  def push(object)
    self << object
  end

  def delete(object)
    if object.is_a? Hash
      object_id = object["objectId"]
    elsif object.is_a? String
      object_id = object
    else
      object_id = object.id
    end

    self.each { |item| super(item) if item.id == object_id }
  end

  def contains?(object)
    self.each { |item| return true if item.attributes == object.attributes }
    false
  end

  def exists?(query)
    each do |item|
      conditions_met = true
      item.attributes.each do |key, value|
        conditions_met = false if query.has_key?(key) and query[key] != value
        break
      end
      return true if conditions_met
    end
    false
  end

  def find(id_to_find)
    each do |item|
      return item if id_to_find == item.id
    end
  end
end
