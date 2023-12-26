class Lockstep::MagicLinkSummary < Lockstep::ApiRecord
  self.model_name_uri = "v1/useraccounts/magic-links/summary"
  self.id_ref = "group_key"
  self.query_path = ""
  load_schema(Schema::MagicLinkSummary)

  def self.with_date(from_date: nil, to_date: nil)
  	additional_query_params({"from": from_date, "to": to_date})
  end
end