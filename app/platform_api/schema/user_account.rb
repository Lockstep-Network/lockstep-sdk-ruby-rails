class Schema::UserAccount < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Accounting Data Service when this record is
  # added to the Accounting Data Service.
  #             
  # This record provides a link to the user's Azure AD B2C OID.
  # @type: string
  # @format: uuid
  field :user_id

  # The GroupKey uniquely identifies a single Accounting Data Service account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The full name of the user
  # @type: string
  field :user_name

  # The email of the user
  # @type: string
  # @format: email
  field :email

  # The status of the user's account
  # @type: string
  field :status

  # The date that the user account was created
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID of the user who created the user account
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date the user account was last modified
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID of the user who last modified the user account
  # @type: string
  # @format: uuid
  field :modified_user_id

  # The ID of the user in Azure B2C
  # @type: string
  # @format: uuid
  field :b2_c_user_id

  # The id of the Permission Level for the user.
  # @type: string
  # @format: uuid
  field :user_role

  # The date timestamp when the invite was sent to the user.
  # @type: string
  # @format: date-time
  field :invite_sent, Types::Params::DateTime

  # The phone number of the user.
  # @type: string
  field :phone_number

  # The fax number of the user.
  # @type: string
  field :fax_number

  # The title of the user; free text field
  # @type: string
  field :title

  # FK to the CodeDefinition table; CodeType = 'AccountingRole'
  # @type: string
  # @format: uuid
  field :accounting_role_code_def_id

  # Address Line 1 for this User
  # @type: string
  field :address1

  # Address Line 2 for this User
  # @type: string
  field :address2

  # Address Line 3 for this User
  # @type: string
  field :address3

  # City for this User
  # @type: string
  field :city

  # Region ("state" in the US) for this User
  # @type: string
  field :state_region

  # Postal Code this User
  # @type: string
  field :postal_code

  # Country for this User This will be validated by the /api/v1/definitions/countries data set
  # @type: string
  field :country

  # Time zone for this user
  # @type: string
  field :time_zone

  # Image URL for this User
  # @type: string
  field :image_url

  # Description for this User.
  # @type: string
  field :description

  # Last date time user logged into Azure B2C.
  # @type: string
  # @format: date-time
  field :b2_c_last_logged_in, Types::Params::DateTime

  # The default currency code used by this user entity.  This value can be overridden
  # for invoices in a different currency code.
  #             
  # For a list of defined currency codes, see [Query Currencies](https://developer.lockstep.io/reference/get_api-v1-definitions-currencies) This will be validated by the /api/v1/definitions/currencies data set
  # @type: string
  field :default_currency_code

  # The IETF language tag for the user's preferred locale.
  # @type: string
  field :locale

  # Accounting role definition for this User.
  # To retrieve this collection, specify `AccountingRole` in the "Include" parameter for your query.
  field :accounting_role_code_definition

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}

  has_many :notes, {:class_name=>"Lockstep::Note", :included=>true, :foreign_key=>:object_key, :polymorphic=>{:table_key=>"UserAccount"}}
  has_many :attachments, {:class_name=>"Schema::Attachment", :included=>true}
  has_many :custom_field_values, {:class_name=>"Schema::CustomFieldValue", :included=>true}

end