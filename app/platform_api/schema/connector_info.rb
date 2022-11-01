class Schema::ConnectorInfo < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The authorization code returned from the first step of the OAuth2 flow
  # https://oauth.net/2/grant-types/authorization-code/
  # @type: string
  field :auth_code

  # The access token id for the connector enrollment.
  # @type: string
  field :token_id

  # The access token secret for the connector enrollment.
  # @type: string
  field :token_secret

  # The realm id of the account being granted permissions to access
  # @type: string
  field :realm_id

  # The subsidiary id that corresponds to a legal entity.
  # @type: string
  field :subsidiary_id

  # The redirect uri used for step one of the OAuth2.0 flow.
  # @type: string
  field :redirect_uri

  # The email an email connection is being created for.
  # @type: string
  field :email

  # The username of the web services account with access permissions.
  # @type: string
  field :username

  # The password for the web services account with access permissions.
  # @type: string
  field :password

  # The server name a connection is being created for.
  # @type: string
  field :server_name

  # The port number of the server a connection is being created for.
  # @type: integer
  # @format: int32
  field :server_port



end