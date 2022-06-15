class Lockstep::ReportDailyPayableOutstanding < Lockstep::ApiRecord
  self.model_name_uri = "v1/Reports/daily-payable-outstanding"
  self.query_path= ""
  load_schema(Schema::DailyPayableOutstandingReport)

end
