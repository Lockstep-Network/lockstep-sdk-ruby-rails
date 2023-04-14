class Lockstep::User < Lockstep::ApiRecord
  self.model_name_uri = "v1/UserAccounts"
  self.id_ref = "user_id"
  load_schema(Schema::UserAccount)

  # # Load the first account
  belongs_to :account, class_name: "Lockstep::Account", loader: ->(user) { Lockstep::Account.first }

  alias_attribute :last_logged_in, :b2_c_last_logged_in

  def self.invite(email_addresses)
    emails = email_addresses.map { |email| { email: email } }
    resp = resource.post('/invite', body: emails, params: {})
    parsed_response = JSON.parse(resp.body)
    if resp.code != '200'
      if resp.code == '401'
        raise Lockstep::Exceptions::UnauthorizedError, 'Unauthorized: Check your App ID & Master Key'
      elsif resp.code == '400'
        raise Lockstep::Exceptions::BadRequestError, parsed_response
      elsif resp.code == '404'
        raise Lockstep::Exceptions::RecordNotFound, 'Resource not found in the Platfrom'
      end
    end

    parsed_response
  end
end
