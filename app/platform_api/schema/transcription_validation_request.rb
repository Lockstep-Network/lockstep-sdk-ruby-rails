class Schema::TranscriptionValidationRequest < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique identifier of the transcription validation request.
  # @type: string
  # @format: uuid
  field :transcription_validation_request_id

  # Group account transcription validation request is associated with.
  # @type: string
  # @format: uuid
  field :group_key

  # A code identifying the status of this transcription validation request.
  #             
  # Recognized Transcription Validation Request status codes are:
  # * `New` - Represents a transcription validation request that is considered new and needs work to complete
  # * `In Progress` - Represents a transcription validation request that is currently being worked on
  # * `Failed` - Represents a transcription validation request that could not complete the validation process
  # * `Complete` - Represents a transcription validation request that is considered complete and does not need any further work
  # @type: string
  field :status_code

  # The date on which this transcription validation request was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID number of the user who created this transcription validation request.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date on which this transcription validation request was last modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID number of the user who most recently modified this transcription validation request.
  # @type: string
  # @format: uuid
  field :modified_user_id

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}

  has_many :items, {:class_name=>"Schema::TranscriptionValidationRequestItem", :included=>true}

end