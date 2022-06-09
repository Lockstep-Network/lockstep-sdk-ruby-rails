class Lockstep::ReportDailySalesOutstanding < Lockstep::ApiRecord
  self.model_name_uri = "v1/Reports/dailysalesoutstanding"
  self.query_path=""
  load_schema(Schema::DailySalesOutstandingReport)

end
