class Schema::AccountingProfileContactResult < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by ADS when this record is
  # added to the ADS Platform.
  #             
  # For the ID of this record in its originating financial system, see `ErpKey`.
  # @type: string
  # @format: uuid
  field :contact_id

  # The ID of the company to which this contact belongs.
  # @type: string
  # @format: uuid
  field :company_id

  # The GroupKey uniquely identifies a single ADS Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The unique ID of this record as it was known in its originating financial system.
  #             
  # If this contact record was imported from a financial system, it will have the value `ErpKey`
  # set to the original primary key number of the record as it was known in the originating financial
  # system.  If this record was not imported, this value will be `null`.
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # The name of the contact.
  # @type: string
  field :contact_name

  # A friendly human-readable code that describes this Contact.
  # @type: string
  field :contact_code

  # The title of the contact.
  # @type: string
  field :title

  # The role code for the contact.
  # @type: string
  field :role_code

  # The email address of the contact.
  # @type: string
  # @format: email
  field :email_address

  # The phone number of the contact.
  # @type: string
  field :phone

  # The fax number of the contact.
  # @type: string
  field :fax

  # The IETF language tag for the contact's locale.
  # @type: string
  field :locale

  # The first line of the address.
  # @type: string
  field :address1

  # The second line of the address.
  # @type: string
  field :address2

  # The third line of the address.
  # @type: string
  field :address3

  # The fourth line of the address.
  # @type: string
  field :address4

  # The city of the address.
  # @type: string
  field :city

  # The state/region of the address.
  # @type: string
  field :state_region

  # The postal/zip code of the address.
  # @type: string
  field :postal_code

  # The two character country code of the address. This will be validated by the /api/v1/definitions/countries data set
  # @type: string
  field :country_code

  # Flag indicating if the contact is active.
  # @type: boolean
  field :is_active

  # The webpage url of the contact.
  # @type: string
  # @format: uri
  field :webpage_url

  # The picture/avatar url of the contact.
  # @type: string
  # @format: uri
  field :picture_url

  # The date on which this record was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID of the user who created this contact.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date on which this record was last modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID of the user who last modified this contact.
  # @type: string
  # @format: uuid
  field :modified_user_id

  # The AppEnrollmentId of the application that imported this record.  For accounts
  # with more than one financial system connected, this field identifies the originating
  # financial system that produced this record.  This value is null if this record
  # was not loaded from an external ERP or financial system.
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # Determines whether the contact is primary or secondary.
  # @type: boolean
  field :is_primary

  # The ID of the profile this contact belongs to.
  # @type: string
  # @format: uuid
  field :accounting_profile_id

  # The ID of the accounting profile contact this contact matches.
  # @type: string
  # @format: uuid
  field :accounting_profile_contact_id

  # The Name of the profile this contact belongs to.
  # @type: string
  field :name

  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}

  has_many :notes, {:class_name=>"Lockstep::Note", :included=>true, :foreign_key=>:object_key, :polymorphic=>{:table_key=>"AccountingProfileContactResult"}}
  has_many :attachments, {:class_name=>"Schema::Attachment", :included=>true}
  has_many :custom_field_definitions, {:class_name=>"Schema::CustomFieldDefinition", :included=>true}
  has_many :custom_field_values, {:class_name=>"Schema::CustomFieldValue", :included=>true}

end