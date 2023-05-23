class Schema::CompanySync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Indicates what action to take when an existing object has been found during the sync process.
  field :on_match_action

  # This is the primary key of the Company record. For this field, you should use whatever the company's unique
  # identifying number is in the originating system. Search for a unique, non-changing number within the
  # originating financial system for this record.
  #             
  # Example: If you store your company records in a database, whatever the primary key for the company table is
  # in the database should be the `ErpKey`.
  #             
  # Example: If you use a financial system such as QuickBooks or Xero, look for the primary ID number of the
  # company record within that financial system.
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # A friendly, short name of the company.
  # @type: string
  field :company_name

  # This field indicates the type of company. It can be one of a limited number of values: `Company`,
  # `Customer`, `Group`, `Vendor`, or `Third Party`. A company that represents both a customer and a vendor is
  # identified as a `CustomerVendor`.
  #             
  # When loading data into Lockstep, you should focus on the distinction between a company that is part of
  # your own enterprise, or a company that is external to your enterprise.
  #             
  # For a company that is within your enterprise, you should set this value to be `Company`.
  #             
  # For a company that is external to your enterprise, you should set this value to either `Customer`,
  # `Vendor`, `Third Party`, or `CustomerVendor`.  If you don't know what value to choose, select
  # `CustomerVendor`.
  # @type: string
  field :company_type

  # If this company has a parent company, identify the parent company's `ErpKey` value here. This value should
  # be the original primary key or unique ID of the parent company to this company belongs. This value should
  # match the original ErpKey field on the parent company.
  #             
  # If this company is not a child company, leave this field null.
  # @type: string
  field :parent_company_erp_key

  # This flag indicates whether the company is currently active. An inactive company will be hidden from the
  # user interface but will still be available for querying.
  # @type: boolean
  field :is_active

  # The default currency code for transactions related to this company.  For a list of currency codes, see
  # [Query Currencies](https://developer.lockstep.io/reference/get_api-v1-definitions-currencies).
  # @type: string
  field :default_currency_code

  # The URL of this company's logo, if known.
  # @type: string
  field :company_logo_url

  # The `ErpKey` of the primary contact for this company.  This value should match the `ErpKey` value of the
  # [Importing Contacts](https://developer.lockstep.io/docs/importing-contacts) record for the contact table.
  # @type: string
  field :primary_contact_erp_key

  # The company's primary mailing address information
  # @type: string
  field :address1

  # The company's primary mailing address information
  # @type: string
  field :address2

  # The company's primary mailing address information
  # @type: string
  field :address3

  # The company's primary mailing address information
  # @type: string
  field :city

  # The company's primary mailing address information
  # @type: string
  field :state_region

  # The company's primary mailing address information
  # @type: string
  field :postal_code

  # The company's primary mailing address information
  # @type: string
  field :country

  # The main phone number of this company.
  # @type: string
  field :phone_number

  # The main fax number of this company.
  # @type: string
  field :fax_number

  # If known, the date when this record was created according to the originating financial system
  # in which this record is maintained.  If the originating financial system does not maintain a
  # created-date, leave this field null.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # If known, the date when this record was most recently modified according to the originating
  # financial system in which this record is maintained.  If the originating financial system does
  # not maintain a most-recently-modified-date, leave this field null.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The company's Tax ID number for the appropriate government for this company.
  # @type: string
  field :tax_id

  # The Dun and Bradstreet number for this company, if known.
  # @type: string
  field :duns_number

  # If you know the AP (accounts payable) email address of this company, fill it in here. This is the email
  # address where you would send questions to the company if the company owed you money.
  # @type: string
  field :ap_email_address

  # If you know the AR (accounts receivable) email address of this company, fill it in here. This is the email
  # address where you would send questions to the company if you owed this company money.
  # @type: string
  field :ar_email_address

  # Indicates the preferred invoice delivery method. Examples include Print, Email, Fax
  # @type: string
  field :preferred_delivery_method

  # The company email address.
  # @type: string
  field :email_address

  # An external reference that identifies the Company from the originating ERP system, separate from the ErpKey.
  # @type: string
  field :external_reference

  # A unique identification number assigned to the company by the national registration office.
  # @type: string
  field :company_registration_number



end