class Schema::ExternalConnector < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # External Connector ID
  # @type: string
  field :id

  # External connector name
  # @type: string
  field :name

  # URL to start onboarding with the given external connector
  # @type: string
  field :onboarding_url

  # Information about the external connector.
  # @type: string
  field :description

  # Categories external connector is associated with
  # @type: array
  field :categories



end