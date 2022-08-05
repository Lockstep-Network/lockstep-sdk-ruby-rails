class Lockstep::ArHeaderInfo < Lockstep::ApiRecord
  self.model_name_uri = "v1/Reports/ar-header"
  self.id_ref = "group_key"
  self.query_path=""
  load_schema(Schema::ApHeaderInfo)

end
