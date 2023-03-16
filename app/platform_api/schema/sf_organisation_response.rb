class Schema::SfOrganisationResponse < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Unique ID of the organisation.
  # @type: string
  field :organisation_id

  # Name of the organisation.
  # @type: string
  field :name

  # Equivalent to GroupKey.
  # @type: string
  field :sage_crm_id

  # Contact email of the app administrator.
  # @type: string
  field :admin_email

  # Your country in the ISO 3166-1 Alpha-3 format.
  # @type: string
  field :primary_country

  # Default language of your organisation in the ISO 639-1 format.
  # This default value is used when a user specifies no language or if the specified language isn't supported.
  # Example: EN
  # @type: string
  field :default_language

  # External ID of your organisation. The ID can contain alphanumeric characters.
  # @type: string
  field :external_id

  # Key for signing requests. This key is only returned for the first 10 minutes after the organisation was created.
  # @type: string
  field :signing_key



end