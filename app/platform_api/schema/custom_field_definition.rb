class Schema::CustomFieldDefinition < Lockstep::ApiRecord

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

  # Table to which this definition belongs
  # @type: string
  field :table_key

  # Id of app this definition belongs to
  # @type: string
  # @format: uuid
  field :app_id

  # Text to display in-application for custom field
  # @type: string
  field :custom_field_label

  # Data type of this definition
  # @type: string
  field :data_type

  # Used for display logic when multiple custom fields exist
  # @type: integer
  # @format: int32
  field :sort_order

  # Date created
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # Id of user who created this definition
  # @type: string
  # @format: uuid
  field :created_user_id

  # Date modified
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # Id of user who modified this definition
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

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}


end