class Lockstep::ReportDailyPayableOutstandingSummary < Lockstep::ApiRecord
  self.model_name_uri = "v1/Reports/daily-payable-outstanding-summary"
  self.query_path= ""
  load_schema(Schema::DailyPayableOutstandingSummaryReport)

  def self.with_report_date(report_date)
    additional_query_params({"reportDate": report_date})
  end

end
