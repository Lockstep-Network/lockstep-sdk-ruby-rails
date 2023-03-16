class Schema::SfServicerResponse < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique identifier for servicer.
  # @type: string
  field :servicer_id

  # Name of the servicer organisation.
  # @type: string
  field :name

  # URL for the dashboard of the servicer.
  # @type: string
  field :dashboard_url

  # Items Enum: "card" "direct-debit"
  # An array of payment types supported by the provider in the companys country.
  # @type: array
  field :capabilities

  # Whether this provider supports an OAuth style flow for linking accounts.
  # @type: boolean
  field :account_linking_supported

  # Whether this provider supports direct creation of an account without user intervention.
  # @type: boolean
  field :account_creation_supported

  # Boolean field indicating whether the servicer supports reusable payment instruments
  # (for example, card tokens and direct debit mandates).
  # @type: boolean
  field :payment_instruments_supported

  # An integer >= 0 indicating the ordering of the provider. Lower numbers mean a higher priority.
  # @type: integer
  # @format: int32
  field :rank

  # Countries where this Servicer operates.
  # @type: array
  field :operating_countries

  # Enum: "AUTH_CODE" "CLIENT_REFERRAL"
  # Represents an oauth type
  # @type: string
  field :oauth_type

  # Endpoint for the given connector API.
  # @type: string
  field :api_endpoint



end