class Schema::SyncRequest < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Lockstep when this record is
  # added to the Lockstep platform.
  # @type: string
  # @format: uuid
  field :sync_request_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The status of processing for this SyncRequest.  When a SyncRequest is created, it is flagged as `Ready`.
  # While it is in queue waiting to be picked up, its status moves to `Connector`.
  # When it is picked up for execution, its status moves to `In Progress`.  When it is complete, its status
  # will move to `Success` or `Failed`.  If another API call cancels the SyncRequest, its status will move
  # to `Cancelled`.
  #             
  # * Ready
  # * Connector
  # * In Progress
  # * Cancelled
  # * Failed
  # * Success
  # @type: string
  field :status_code

  # The name of the OperationType for this SyncRequest
  # @type: string
  field :operation_type_name

  # Possible operation types for a SyncRequest
  field :operation_type

  # Message containing information about the sync request results
  # @type: string
  field :process_result_message

  # The number of times this Sync Request has failed
  # @type: integer
  # @format: int32
  field :failure_count

  # A boolean indicating whether a sync from an ERP system should process all the data from the ERP
  # as opposed to just the delta of changes since the previous sync run
  # @type: boolean
  field :run_full_sync

  # The AppEnrollmentId of the AppEnrollment object that executed this sync request
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # The date this sync request was created
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The date this sync request was last modified
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID number of the user who most recently modified this sync request.
  # @type: string
  # @format: uuid
  field :modified_user_id

  # The detailed list of results and errors that occurred during the processing of this SyncRequest.  This
  # information is available only after the SyncRequest has completed.  You will only be able to fetch this
  # field if the SyncRequest's `StatusCode` field is set to `Cancelled`, `Success`, or `Failed`.
  #             
  # To retrieve this collection, add the keyword `details` to the `include` parameter on your Retrieve or
  # Query requests.
  # @type: object
  field :details

  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}


end