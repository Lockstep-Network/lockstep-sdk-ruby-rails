class Schema::SfOrganisationRequest < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Optional name of Service Fabric org
  # @type: string
  field :name

  # This will be your GroupKey
  # @type: string
  field :sage_crm_id

  # Your country in the ISO 3166-1 Alpha-3 format.
  # @type: string
  field :primary_country

  # Contact email of the app administrator.
  # Make sure you specify a valid email - you'll need it later.
  # @type: string
  # @format: email
  field :admin_email

  # Default language of your organisation in the ISO 639-1 format.
  # This default value is used when a user specifies no language
  # or if the specified language isn't supported.
  # @type: string
  field :default_language

  # This will be your GroupKey
  # @type: string
  field :external_id



end