class Schema::SfCustomerRequest < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The external identifier of this customer.
  # @type: string
  field :external_id

  # Country (based on 3-char ISO/DI-3166 country code)
  # @type: string
  field :country

  # Currency of the customer account as an ISO 4217 currency code.
  # @type: string
  field :currency

  # The first name of the customer.
  # @type: string
  field :first_name

  # The last name of the customer.
  # @type: string
  field :last_name

  # The name of the company if this customer is a company.
  # @type: string
  field :company_name

  # The email address of the customer. If an empty string, this will be mapped to null.
  # @type: string
  # @format: email
  field :email_address

  # The telephone number of the customer.
  # @type: string
  field :contact_tel_no

  # The tax number for the customer; this may be a VAT number for a company,
  # or some other form of ID number for an individual.
  # @type: string
  field :tax_number

  # Address of a Company, Provider or Customer.
  # All fields are optional; without address line 1, city or country some operations may not be supported.
  field :address



end