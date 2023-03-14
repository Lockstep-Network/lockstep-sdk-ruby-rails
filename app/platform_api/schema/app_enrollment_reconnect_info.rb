class Schema::AppEnrollmentReconnectInfo < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The OAuth authentication code.
  # @type: string
  field :auth_code

  # The username for the web services account with access permissions.
  # @type: string
  field :username

  # The password for the web services account with access permissions.
  # @type: string
  field :password

  # The Realm Id for the app enrollment to reconnect.
  # @type: string
  field :realm_id

  # The access token id for the connector enrollment.
  # @type: string
  field :token_id

  # The access token secret for the connector enrollment.
  # @type: string
  field :token_secret

  # The OAuth redirect uri.
  # @type: string
  field :redirect_uri



end