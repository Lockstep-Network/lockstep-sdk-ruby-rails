class Lockstep::ReportPayableComingDue < Lockstep::ApiRecord
  self.model_name_uri = "v1/Reports/payables-coming-due"
  self.query_path= ""
  load_schema(Schema::PayableComingDueReport)

end
