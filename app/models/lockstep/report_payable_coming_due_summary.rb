class Lockstep::ReportPayableComingDueSummary < Lockstep::ApiRecord
  self.model_name_uri = "v1/Reports/payables-coming-due-summary"
  self.query_path= ""
  load_schema(Schema::PayableComingDueSummaryReport)
  single_record!

end
