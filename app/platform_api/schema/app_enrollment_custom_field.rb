class Schema::AppEnrollmentCustomField < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Unique id for the app enrollment
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # Id of enrolled app
  # @type: string
  # @format: uuid
  field :app_id

  # The name of the application
  # @type: string
  field :name

  # Tag for what type of app the application is
  # @type: string
  field :app_type

  # The GroupKey uniquely identifies a single Accounting Data Service account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # Unique Id for the custom field definition
  # @type: string
  # @format: uuid
  field :custom_field_definition_id

  # Text to display in-application for custom field
  # @type: string
  field :custom_field_label

  # Data type of the custom field definition
  # @type: string
  field :data_type

  # Used for display logic when multiple app enrollment custom fields exist
  # @type: integer
  # @format: int32
  field :sort_order

  # String of data for field
  # @type: string
  field :string_value

  # Number data for field
  # @type: number
  # @format: double
  field :numeric_value

  # Value for the field
  # @type: string
  field :value



end