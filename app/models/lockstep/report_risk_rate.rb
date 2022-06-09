class Lockstep::ReportRiskRate < Lockstep::ApiRecord
  self.model_name_uri = "v1/Reports/riskrates"
  self.id_ref = "group_key"
  self.query_path=""
  load_schema(Schema::RiskRate)

end
