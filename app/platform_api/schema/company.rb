class Schema::Company < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Lockstep when this record is
  # added to the Lockstep platform.
  #             
  # For the ID of this record in its originating financial system, see `ErpKey`.
  # @type: string
  # @format: uuid
  field :company_id

  # The short name of the company.
  # @type: string
  field :company_name

  # The unique ID of this record as it was known in its originating financial system.
  #             
  # If this company record was imported from a financial system, it will have the value `ErpKey`
  # set to the original primary key number of the record as it was known in the originating financial
  # system.  If this record was not imported, this value will be `null`.
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # This field indicates the type of company.  It can be one of a limited number of values:
  # Company, Customer, Group, Vendor, or Third Party.  A company that represents both a customer and a vendor
  # is identified as a CustomerVendor.
  #             
  # * `Company` - This record represents a company that is part of the organization of the account holder.
  # * `Customer` - This record represents a business entity that purchases things from the account holder.
  # * `Group` - Only one record of type `GROUP` exists in each account.  Contains your account profile.
  # * `Vendor` - This record represents a business entity that sells things to the account holder.
  # * `Third Party` - This record represents a business entity that is neither a customer nor vendor.
  # * `CustomerVendor` - Both a customer and a vendor.
  # * `CompanyProfile` - Profile for a Company, each Company should have at most 1 profile, used only for Profile Management.
  # @type: string
  field :company_type

  # If this business entity is part of an organization, this value is non-null and it is set
  # to the `CompanyId` value of the parent company of this business entity.
  #             
  # If this value is null, this business entity is a standalone.
  # @type: string
  # @format: uuid
  field :parent_company_id

  # For convenience, this field indicates the top-level parent company.  This can be used
  # to jump directly to the top parent in complex organizational hierarchies.
  # @type: string
  # @format: uuid
  field :enterprise_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # This flag indicates whether the company is currently active.  An inactive company
  # should be hidden from the user interface but will still be available for querying.
  # @type: boolean
  field :is_active

  # The default currency code used by this business entity.  This value can be overridden
  # for invoices in a different currency code.
  #             
  # For a list of defined currency codes, see [Query Currencies](https://developer.lockstep.io/reference/get_api-v1-definitions-currencies)
  # @type: string
  field :default_currency_code

  # The URL of this company's logo, if known.
  # @type: string
  field :company_logo_url

  # The Lockstep `ContactId` of the primary contact for this company.
  # @type: string
  # @format: uuid
  field :primary_contact_id

  # Address info
  # @type: string
  field :address1

  # Address info
  # @type: string
  field :address2

  # Address info
  # @type: string
  field :address3

  # Address info
  # @type: string
  field :city

  # Address info
  # @type: string
  field :state_region

  # Address info
  # @type: string
  field :postal_code

  # Address info
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

  # The date this company was created
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID of the user who created this company
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date this company was last modified
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID of the user who last modified this company
  # @type: string
  # @format: uuid
  field :modified_user_id

  # The name of the user who last modified this company
  # @type: string
  field :modified_user_name

  # Federal Tax ID
  # @type: string
  field :tax_id

  # Dun & Bradstreet Number
  # @type: string
  field :duns_number

  # AP (Accounts Payable) Email Address
  # @type: string
  # @format: email
  field :ap_email_address

  # AR (Accounts Receivable) Email Address
  # @type: string
  # @format: email
  field :ar_email_address

  # Indicates the preferred invoice delivery method. Examples include Print, Email, Fax
  # @type: string
  field :preferred_delivery_method

  # For companies that use a custom domain name for their email system, this is
  # the domain name used by this company.  If this value is known, new emails that
  # come in from this domain will be connected to this company.
  # @type: string
  field :domain_name

  # Identifier for classification of this company.
  # @type: string
  # @format: uuid
  field :company_classification_code_def_id

  # Description of the company.
  # @type: string
  field :description

  # Website URL for this company.
  # @type: string
  field :website

  # The AppEnrollmentId of the application that imported this record.  For accounts
  # with more than one financial system connected, this field identifies the originating
  # financial system that produced this record.  This value is null if this record
  # was not loaded from an external ERP or financial system.
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # Company Email Address
  # @type: string
  # @format: email
  field :email_address

  # The public url slug for the Company.
  # @type: string
  field :public_url_slug

  # State Tax ID
  # @type: string
  field :state_tax_id

  # The state where the company was registered.
  # @type: string
  field :state_of_incorporation

  # Linkedin Url
  # @type: string
  field :linked_in_url_slug

  # This flag indicates whether the company is verified.
  # @type: boolean
  field :is_verified

  # The date this company was last verified.
  # @type: string
  # @format: date-time
  field :last_verified_date, Types::Params::DateTime

  # View box settings for the company logo.
  field :view_box_settings

  # The unique ID of the Service Fabric organisation to which this record belongs.
  # @type: string
  # @format: uuid
  field :service_fabric_org_id

  # The unique ID of this record within Service Fabric.
  # @type: string
  # @format: uuid
  field :service_fabric_company_id

  # A unique identification number assigned to the company by the national registration office.
  # @type: string
  field :company_registration_number

  # An optional reference to a real company, making this a profile.
  # @type: string
  # @format: uuid
  field :profile_reference_id

  # All invoices attached to this company.
  #             
  # To retrieve this collection, specify `Invoices` in the "Include" parameter for your query. For more information on Invoices, see [InvoiceModel](https://developer.lockstep.io/reference/get_api-v1-invoices-id).
  # @type: array
  field :invoices

  # Classification code definition for this company.
  #             
  # To retrieve this collection, specify `Classification` in the "Include" parameter for your query.
  field :company_classification_code_definition

  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}

  has_many :notes, {:class_name=>"Lockstep::Note", :included=>true, :foreign_key=>:object_key, :polymorphic=>{:table_key=>"Company"}}
  has_many :attachments, {:class_name=>"Schema::Attachment", :included=>true}
  has_many :contacts, {:class_name=>"Schema::Contact", :included=>true}
  has_many :custom_field_definitions, {:class_name=>"Schema::CustomFieldDefinition", :included=>true}
  has_many :custom_field_values, {:class_name=>"Schema::CustomFieldValue", :included=>true}

end