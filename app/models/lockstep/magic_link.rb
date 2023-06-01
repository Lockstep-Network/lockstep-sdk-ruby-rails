class Lockstep::MagicLink < Lockstep::ApiRecord
  self.model_name_uri = "v1/useraccounts/magic-links"
  self.id_ref = "magic_link_id"
  self.query_path = nil
  load_schema(Schema::MagicLink)

  def self.generate(email_id, expiry, app_id, user_role, company_id, accounting_profile_id)
    body = { email: email_id,
      expiresInMinutes: expiry, applicationId: app_id,
      userRole: user_role, companyId: company_id,
      accountingProfileId: accounting_profile_id }
    body = body.compact

    resource.post_magic_link('', body: body, params: {})
  end
end
