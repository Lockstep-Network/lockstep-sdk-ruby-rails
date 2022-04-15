class Schema::Country < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Name of the country
  # @type: string
  field :name

  # 2 letter alphabetic code for the given country
  # @type: string
  field :alpha2

  # 3 letter alphabetic code for the given country
  # @type: string
  field :alpha3

  # Unique 3 digit number for the given country
  # @type: integer
  # @format: int32
  field :country_code

  # Region of the country
  # @type: string
  field :region

  # Subregion of the country
  # @type: string
  field :sub_region

  # Intermediate region of the country
  # @type: string
  field :intermediate_region

  # Numeric code for a region
  # @type: integer
  # @format: int32
  field :region_code

  # Numeric code for a subregion
  # @type: integer
  # @format: int32
  field :sub_region_code

  # Numeric code for an intermediate region
  # @type: integer
  # @format: int32
  field :intermediate_region_code

  # French name of the country
  # @type: string
  field :french_name

  # A different name for a country
  # @type: string
  field :aliases



end