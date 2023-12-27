class Lockstep::MagicLinkSummary < Lockstep::ApiRecord
  self.model_name_uri = "v1/useraccounts/magic-links/summary"
  self.id_ref = "group_key"
  self.query_path = ""
  load_schema(Schema::MagicLinkSummary)

  def self.with_date(from_date: nil, to_date: nil)
  	resp = resource.get('', params: { from: from_date, to: to_date })
    raise Lockstep::Exceptions::BadRequestError, 'Endpoint not found' if resp.code == '404'
    raise Lockstep::Exceptions::ApiResponseError.new("#{resp.code} error while fetching: #{resp.body}") unless %w(201 200).include?(resp.code.to_s)

    summary = JSON.parse(resp.body)

    summary.deep_transform_keys!(&:underscore).deep_symbolize_keys!
  end
end