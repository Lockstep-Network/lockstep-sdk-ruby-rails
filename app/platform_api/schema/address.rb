class Schema::Address < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Address line 1.
  # @type: string
  field :address_line1

  # Address line 2.
  # @type: string
  field :address_line2

  # Address line 3.
  # @type: string
  field :address_line3

  # Address line 4.
  # @type: string
  field :address_line4

  # Subdivision of a country. For example, state, county, or region.
  # @type: string
  field :country_subdivision

  # Postal/zip code.
  # @type: string
  field :postal_code

  # Country in the ISO 3166-1 Alpha-3 format.
  # @type: string
  field :country



end