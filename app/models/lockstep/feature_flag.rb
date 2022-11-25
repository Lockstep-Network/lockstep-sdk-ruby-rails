class Lockstep::FeatureFlag < Lockstep::ApiRecord
  self.model_name_uri = "v1/feature-flags"
  self.query_path=""
  load_schema(Schema::FeatureFlag)

  # Create method to override conventional create in lockstep/api_record.rb for sending attrs as an enclosed hash/object
  def create
    resp = resource.post('', body: attributes)
    result = post_result(resp)
  end

end