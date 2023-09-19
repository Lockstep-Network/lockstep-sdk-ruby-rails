class Schema::ExternalConnectorToken < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # ID of the token reference.
  # @type: string
  field :id

  # When the user was authenticated.
  # @type: string
  # @format: date-time
  field :authenticated_at, Types::Params::DateTime

  # An array of scopes requested from 3rd-party external connector.
  # @type: array
  field :scopes

  # When the token expires. This can be earlier if the token is revoked.
  # @type: string
  # @format: date-time
  field :expires_at, Types::Params::DateTime

  # External Connector ID
  # @type: string
  field :external_connector_id

  # Connection context ID set by the product when starting onboarding with a external connector
  # @type: string
  field :connection_context_id



end