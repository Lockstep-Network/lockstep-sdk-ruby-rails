class Lockstep::VendorSummary < Lockstep::ApiRecord
  self.model_name_uri = "v1/Companies/views/vendor-summary"
  self.id_ref = "vendor_id"
  self.query_path = ""
  load_schema(Schema::VendorSummary)

  def self.with_report_date(report_date)
  	additional_query_params({"reportDate": report_date})
  end

end