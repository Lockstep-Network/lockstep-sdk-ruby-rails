class Lockstep::MagicLink < Lockstep::ApiRecord
  self.model_name_uri = "v1/useraccounts/magic-links"
  self.id_ref = "magicLinkId"
  self.query_path = ""

  def self.generate_magic_link(email_id, expiry, app_id, user_role)
    body = {email: email_id, expiresInMinutes: expiry, applicationId: app_id, userRole: user_role}
    resource.post_magic_link('', body: body, params: {})
  end
end