class Lockstep::ReportApAgingHeader < Lockstep::ApiRecord
  self.model_name_uri = "v1/Reports/ap-aging-header"
  self.id_ref = "group_key"
  self.query_path= ""
  load_schema(Schema::ApAgingHeaderInfo)

end
