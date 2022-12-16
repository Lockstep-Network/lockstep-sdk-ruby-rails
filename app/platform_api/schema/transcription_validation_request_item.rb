class Schema::TranscriptionValidationRequestItem < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique identifier of the transcription validation request item.
  # @type: string
  # @format: uuid
  field :transcription_validation_request_item_id

  # The ID number of the transcription validation request this item belongs to.
  # @type: string
  # @format: uuid
  field :transcription_validation_request_id

  # Group account transcription validation request item is associated with.
  # @type: string
  # @format: uuid
  field :group_key

  # Generated hash of the file being validated.
  # @type: string
  field :file_hash

  # Original name of the file on disk, without its extension.
  # @type: string
  field :file_name

  # Original extension name of the file on disk.
  # @type: string
  field :file_ext

  # Location of file in blob storage to be validated.
  # @type: string
  field :file_location

  # Transcription result
  # @type: string
  field :transcription_result

  # Transcription process start date
  # @type: string
  # @format: date-time
  field :process_start, Types::Params::DateTime

  # Transcription process end date
  # @type: string
  # @format: date-time
  field :process_end, Types::Params::DateTime

  # Amount of times item was processed to retrieve the transcription data
  # @type: integer
  # @format: int32
  field :retry_count

  # Feedback result specified by the client when the transcription result is not correct. This feedback result will be sent back to the transcription services to retrain and improve models over time.
  # @type: string
  field :feedback_result

  # Date when feedback result was sent back to transcription service.
  # @type: string
  # @format: date-time
  field :feedback_sent, Types::Params::DateTime

  # A code identifying the status of this transcription validation request item.
  #             
  # Recognized Transcription Validation Request status codes are:
  # * `New` - Represents a transcription validation request item that is considered new and needs work to complete
  # * `In Progress` - Represents a transcription validation request item that is currently being worked on
  # * `Failed` - Represents a transcription validation request item that could not complete the validation process
  # * `Complete` - Represents a transcription validation request item that is considered complete and does not need any further work
  # @type: string
  field :status_code

  # The date on which this transcription validation request item was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID number of the user who created this transcription validation request item.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date on which this transcription validation request item was last modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID number of the user who most recently modified this transcription validation request item.
  # @type: string
  # @format: uuid
  field :modified_user_id

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}


end