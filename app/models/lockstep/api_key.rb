class Lockstep::ApiKey < Lockstep::ApiRecord
  self.model_name_uri = "v1/ApiKeys"
  self.id_ref = "api_key_id"
  load_schema(Schema::ApiKey)

  default_scope { where('Revoked is null') }

  # Create method to override conventional create in lockstep/api_record.rb of sending attrs as an enclosed array
  def create
    attrs = attributes_for_saving.transform_keys { |key| key.camelize(:lower) }
    resp = resource.post('', body: attrs, params: nil)
    result = post_result(resp)
  end
end
