class Schema::ErpInfoData < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The authorization code returned from the first step of the OAuth2 flow
  # https://oauth.net/2/grant-types/authorization-code/
  # @type: string
  field :auth_code

  # The realm id of the account being granted permissions to access
  # @type: string
  field :realm_id

  # The redirect uri used for step one of the OAuth2.0 flow.
  # @type: string
  field :redirect_uri



end