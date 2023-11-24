class Schema::InboundCompanySync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique identifier of this object in the Sage Network platform.
  # @type: string
  # @format: uuid
  field :network_id

  # Read or write operation for sync
  # @type: string
  field :operation_type

  # The short name of the company.
  # @type: string
  field :company_name

  # This field indicates the type of company.  It can be one of a limited number of values:
  # Company, Customer, Group, Vendor, or Third Party.  A company that represents both a customer and a vendor
  # is identified as a CustomerVendor.
  #             
  # The following are the company types currently supported for Erp Writes
  #             
  # * `Customer` - This record represents a business entity that purchases things from the account holder.
  # * `Vendor` - This record represents a business entity that sells things to the account holder.
  # * `CustomerVendor` - Both a customer and a vendor.
  # @type: string
  field :company_type

  # If this business entity is part of an organization, this value is non-null and it is set
  # to the `CompanyId` value of the parent company of this business entity.
  #             
  # If this value is null, this business entity is a standalone.
  # @type: string
  # @format: uuid
  field :parent_company_network_id

  # The unique ID of the parent company as it was known in its originating financial system.
  # @type: string
  field :parent_company_erp_key

  # The default currency code used by this business entity.  This value can be overridden
  # for invoices in a different currency code.
  #             
  # For a list of defined currency codes, see [Query Currencies](https://developer.lockstep.io/reference/get_api-v1-definitions-currencies)
  # @type: string
  field :default_currency_code

  # The external reference of the company.
  #             
  # For Sage Intacct enrollments this field is required and must be a unique value to be used as the Vendor Id
  # @type: string
  field :external_reference

  # Federal Tax ID
  # @type: string
  field :tax_id

  # For convenience, this field indicates the top-level parent company.  This can be used
  # to jump directly to the top parent in complex organizational hierarchies.
  # @type: string
  # @format: uuid
  field :enterprise_id

  # The unique ID of the enterprise as it was known in its originating financial system.
  # @type: string
  field :enterprise_erp_key

  # The first line of the address.
  # @type: string
  field :address1

  # The second line of the address.
  # @type: string
  field :address2

  # The third line of the address.
  # @type: string
  field :address3

  # The city of the address.
  # @type: string
  field :city

  # The state/region of the address.
  # @type: string
  field :state_region

  # The postal/zip code of the address.
  # @type: string
  field :postal_code

  # The two character country code of the address.
  # @type: string
  field :country

  # Time zone
  # @type: string
  field :time_zone

  # Phone number
  # @type: string
  field :phone_number

  # Fax number
  # @type: string
  field :fax_number

  # Company Email Address
  # @type: string
  field :email_address

  # Dun & Bradstreet Number
  # @type: string
  field :duns_number

  # Federal Tax ID
  # @type: string
  field :state_tax_id

  # The state where the company was registered.
  # @type: string
  field :state_of_incorporation

  # The primary contact for the company.
  field :primary_contact

  # Sync time
  # @type: string
  # @format: date-time
  field :timestamp, Types::Params::DateTime

  # Last Sync time
  # @type: string
  # @format: date-time
  field :last_attempted, Types::Params::DateTime

  # Erp write status
  # @type: string
  field :status

  # Erp write status message
  # @type: string
  field :message



end