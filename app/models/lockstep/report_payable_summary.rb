class Lockstep::ReportPayableSummary < Lockstep::ApiRecord
  self.model_name_uri = "v1/Reports/payables-summary"
  self.query_path= ""
  load_schema(Schema::PayableSummaryReport)
  single_record!

end
