class Lockstep::ReportArAgingHeader < Lockstep::ApiRecord
  self.model_name_uri = "v1/Reports/ar-aging-header"
  self.id_ref = "group_key"
  self.query_path=""
  load_schema(Schema::ArAgingHeaderInfo)

end
