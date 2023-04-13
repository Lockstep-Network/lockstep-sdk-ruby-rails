class Lockstep::UserInvite < Lockstep::ApiRecord
  self.model_name_uri = "v1/UserAccounts/invite"
  self.id_ref = "user_id"
  load_schema(Schema::UserAccountInvite)

  def self.invite(email_addresses)
    emails = email_addresses.map { |email| { email: email } }
    resp = resource.post('', body: emails, params: {})
    result = JSON.parse(resp.body)
  end
end
