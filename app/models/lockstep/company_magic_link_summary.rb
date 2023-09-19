class Lockstep::CompanyMagicLinkSummary < Lockstep::ApiRecord
  self.model_name_uri = "v1/Companies/views/magic-link-summary"
  self.id_ref = "company_id"
  self.query_path = ""
  load_schema(Schema::CompanyMagicLinkSummary)
end