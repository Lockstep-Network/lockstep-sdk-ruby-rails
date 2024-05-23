class Schema::AppEnrollment < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by ADS when this record is
  # added to the ADS Platform.
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # The ID number of the Application that this enrollment represents.  You can fetch information
  # about this Application object by specifying `App` in the "Include" parameter for your request.
  # @type: string
  # @format: uuid
  field :app_id

  # The GroupKey uniquely identifies a single ADS Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # Determines whether the app enrollment is in use
  # @type: boolean
  field :is_active

  # Created date
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # Created user ID
  # @type: string
  # @format: uuid
  field :created_user_id

  # Last modified date
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # Last user ID to modify
  # @type: string
  # @format: uuid
  field :modified_user_id

  # Stores schedule information for the application enrollment
  # see https://en.wikipedia.org/wiki/Cron
  # @type: string
  field :cron_settings

  # Flag indicating if the Sync process should be ran on the specified schedule
  # @type: boolean
  field :sync_schedule_is_active

  # Flag indicating if the App Enrollment is currently being deleted from the Platform.
  # @type: boolean
  field :is_deleted

  # The Application to which this AppEnrollment belongs.  Contains general name, description,
  # logo, and other metadata about this application.
  #             
  # To retrieve this object, specify `App` in the "Include" parameter for your query.
  field :app

  # Data about the last sync attached to this app enrollment
  #             
  # To retrieve this collection, specify `LastSync` in the "Include" parameter for your query.
  field :last_sync

  # Data about the last successful sync associated with this enrollment
  field :last_successful_sync

  # Optional data necessary to create an app enrollment for a supported connector.
  # Only enter relevant fields for the given connector.
  field :connector_info

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}

  has_many :custom_field_definitions, {:class_name=>"Schema::CustomFieldDefinition", :included=>true}
  has_many :custom_field_values, {:class_name=>"Schema::CustomFieldValue", :included=>true}

end