class Lockstep::ApHeader < Lockstep::ApiRecord
  self.model_name_uri = "v1/Reports/ap-header"
  self.id_ref = "group_key"
  self.query_path= ""
  load_schema(Schema::ApHeaderInfo)

end

class Lockstep::Query
  def build_params
    params = {}
    params.merge!({ :reportDate => criteria[:conditions].first[:report_date]})
    return params
  end

  def get_results(params = {})
  resp = @klass.resource.get(@klass.query_path, :params => params)

  return [] if %w(404).include?(resp.code.to_s)
  # TODO handle non 200 response code. Throwing an exception for now
  raise StandardError.new("#{resp.code} error while fetching: #{resp.body}") unless %w(201 200).include?(resp.code.to_s)

  parsed_response = JSON.parse(resp.body)

  r = parsed_response.transform_keys { |key| key.underscore }
  @klass.model_name.to_s.constantize.new(r, false)
  end
end
