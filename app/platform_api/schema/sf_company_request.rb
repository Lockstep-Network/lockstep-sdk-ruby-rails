class Schema::SfCompanyRequest < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Name for the company.
  # @type: string
  field :name

  # Unique external ID of the company.
  # @type: string
  field :external_id

  # Company tax number. The value you should use as a company tax number depends on your country.
  # @type: string
  field :tax_number

  # Standard Industrial Classification (SIC) code for the company.
  # @type: string
  field :standard_industrial_code

  # Contact telephone number of the company.
  # @type: string
  field :contact_tel_no

  # Contact email of the company.
  # @type: string
  # @format: email
  field :contact_email

  # Postal address.
  field :address



end