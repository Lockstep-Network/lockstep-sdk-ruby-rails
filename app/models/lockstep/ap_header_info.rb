class Lockstep::ApHeaderInfo < Lockstep::ApiRecord
  self.model_name_uri = "v1/Reports/ap-header"
  self.id_ref = "group_key"
  self.query_path=""
  load_schema(Schema::ApHeaderInfo)
  single_record!

end
