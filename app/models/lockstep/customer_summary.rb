class Lockstep::CustomerSummary < Lockstep::ApiRecord
  self.model_name_uri = "v1/Companies/views/customer-summary"
  self.id_ref = "company_id"
  self.query_path = ""
  load_schema(Schema::CustomerSummary)
end
