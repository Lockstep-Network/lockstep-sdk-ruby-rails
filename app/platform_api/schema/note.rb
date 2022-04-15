class Schema::Note < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Lockstep when this record is
  # added to the Lockstep platform.
  # @type: string
  # @format: uuid
  field :note_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The name of the table the note is associated with
  # @type: string
  field :table_key

  # The ID of the object the note is associated with
  # @type: string
  # @format: uuid
  field :object_key

  # The text of the note
  # @type: string
  field :note_text

  # The type of the note
  # @type: string
  field :note_type

  # Flag indicating if the note has been archived
  # @type: boolean
  field :is_archived

  # The date the note was created
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID of the user who created the note
  # @type: string
  # @format: uuid
  field :created_user_id

  # The name of the user who created the note
  # @type: string
  field :created_user_name

  # The AppEnrollmentId of the application that imported this record.  For accounts
  # with more than one financial system connected, this field identifies the originating
  # financial system that produced this record.  This value is null if this record
  # was not loaded from an external ERP or financial system.
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # The person to whom this note is intended for.
  # @type: string
  field :recipient_name

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}


end