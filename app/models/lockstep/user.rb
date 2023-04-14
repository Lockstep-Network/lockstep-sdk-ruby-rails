class Lockstep::User < Lockstep::ApiRecord
  self.model_name_uri = "v1/UserAccounts"
  self.id_ref = "user_id"
  load_schema(Schema::UserAccount)

  def self.invite(email_addresses)
    emails = email_addresses.map { |email| { email: email } }
    resp = resource.post('/invite', body: emails, params: {})
    parsed_response = JSON.parse(resp.body)
    raise Lockstep::Exceptions::BadRequestError, parsed_response['title'] unless resp.code == '200'

    parsed_response
  end

  # # Load the first account
  belongs_to :account, class_name: "Lockstep::Account", loader: ->(user) { Lockstep::Account.first }

  alias_attribute :last_logged_in, :b2_c_last_logged_in
end
