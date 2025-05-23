class Schema::CustomFieldValue < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The GroupKey uniquely identifies a single Accounting Data Service account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The unique ID of this record, automatically assigned by ADS when this record is
  # added to the Accounting Data Service.
  # @type: string
  # @format: uuid
  field :custom_field_definition_id

  # Additional key if source table doesn't have a unique id
  # @type: string
  # @format: uuid
  field :record_key

  # Table to which this definition belongs
  # @type: string
  field :table_key

  # Text to display in-application for custom field
  # @type: string
  field :custom_field_label

  # Data type of this definition
  # @type: string
  field :data_type

  # String of data for field
  # @type: string
  field :string_value

  # Number data for field
  # @type: number
  # @format: double
  field :numeric_value

  # Date created
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # Id of user who created this value
  # @type: string
  # @format: uuid
  field :created_user_id

  # Date modified
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # Id of user who modified this value
  # @type: string
  # @format: uuid
  field :modified_user_id

  # The AppEnrollmentId of the application that imported this attachment record.  For accounts
  # with more than one financial system connected, this field identifies the originating
  # financial system that produced this record.  This value is null if this record
  # was not loaded from an external ERP or financial system.
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # The value of this custom field.
  # @type: string
  field :value

  # Definition of the value
  field :custom_field_definition

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}


end