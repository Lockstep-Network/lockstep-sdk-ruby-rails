class Schema::AppEnrollmentReconnectInfo < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The OAuth authentication code.
  # @type: string
  field :auth_code

  # The OAuth authentication code.
  # @type: string
  field :username

  # The password for the web services account with access permissions.
  # @type: string
  field :password

  # The access token id for the connector enrollment.
  # @type: string
  field :token_id

  # The access token secret for the connector enrollment.
  # @type: string
  field :token_secret



end