class Schema::AccountingProfileRequest < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Lockstep when this record is
  # added to the Lockstep platform.
  # @type: string
  # @format: uuid
  field :accounting_profile_id

  # The ID of the company profile to which this accounting profile belongs.
  # @type: string
  # @format: uuid
  field :company_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The name of the accounting profile.
  # @type: string
  field :name

  # The type of the accounting profile.
  # Some examples include 'AR', 'AP', 'AR+AP', 'General Accounting', 'Treasury', 'Payroll', 'Finance'
  # @type: string
  field :type

  # The email address associated with the accounting profile.
  # @type: string
  # @format: email
  field :email_address

  # The phone number associated with the accounting profile.
  # @type: string
  field :phone

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
  field :region

  # The postal/zip code of the address.
  # @type: string
  field :postal_code

  # The two character country code of the address.
  # @type: string
  field :country

  # The date on which this record was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID of the user who created this accounting profile.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date on which this record was last modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID of the user who last modified this accounting profile.
  # @type: string
  # @format: uuid
  field :modified_user_id

  # The ID of the primary contact that is linked to this profile.
  # @type: string
  # @format: uuid
  field :primary_contact_id

  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}

  has_many :notes, {:class_name=>"Lockstep::Note", :included=>true, :foreign_key=>:object_key, :polymorphic=>{:table_key=>"AccountingProfileRequest"}}
  has_many :attachments, {:class_name=>"Schema::Attachment", :included=>true}
  has_many :custom_field_definitions, {:class_name=>"Schema::CustomFieldDefinition", :included=>true}
  has_many :custom_field_values, {:class_name=>"Schema::CustomFieldValue", :included=>true}

end