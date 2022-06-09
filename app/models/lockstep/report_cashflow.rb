class Lockstep::ReportCashflow < Lockstep::ApiRecord
  self.model_name_uri = "v1/Reports/cashflow"
  self.query_path=""
  load_schema(Schema::CashflowReport)
  single_record!

end
