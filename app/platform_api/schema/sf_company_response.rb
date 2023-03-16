class Schema::SfCompanyResponse < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Unique ID of the company.
  # @type: string
  field :company_id

  # Unique ID of the organisation to which the company belongs.
  # @type: string
  field :organisation_id

  # Name for the company.
  # @type: string
  field :name

  # Access URL for the company logo image, if a logo image has been uploaded.
  # @type: string
  field :logo_url

  # Postal address.
  field :address

  # Company tax number. The value you should use as a company tax number depends on your country.
  # @type: string
  field :tax_number

  # Standard Industrial Classification (SIC) code for the company.
  # @type: string
  field :standard_industrial_code

  # Unique external ID of the company.
  # @type: string
  field :external_id

  # Contact telephone number of the company.
  # @type: string
  field :contact_tel_no

  # Contact email of the company.
  # @type: string
  field :contact_email

  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}


end