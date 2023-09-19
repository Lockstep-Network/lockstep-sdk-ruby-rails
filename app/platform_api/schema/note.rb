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

  # A Note is connected to an existing item within the Lockstep Platform by the fields `TableKey` and
  # `ObjectKey`.  For example, a Note connected to Invoice 12345 would have a `TableKey` value of
  # `Invoice` and an `ObjectKey` value of `12345`.
  #             
  # The `TableKey` value contains the name of the table within the Lockstep Platform to which this metadata
  # is connected.
  #             
  # For more information, see [linking metadata to an object](https://developer.lockstep.io/docs/custom-fields#linking-metadata-to-an-object).
  # @type: string
  field :table_key

  # A Note is connected to an existing item within the Lockstep Platform by the fields `TableKey` and
  # `ObjectKey`.  For example, a Note connected to Invoice 12345 would have a `TableKey` value of
  # `Invoice` and an `ObjectKey` value of `12345`.
  #             
  # The `ObjectKey` value contains the primary key of the record within the Lockstep Platform to which this
  # metadata is connected.
  #             
  # For more information, see [linking metadata to an object](https://developer.lockstep.io/docs/custom-fields#linking-metadata-to-an-object).
  # @type: string
  # @format: uuid
  field :object_key

  # The full text of the note
  # @type: string
  field :note_text

  # The type of the note
  # @type: string
  field :note_type

  # A flag indicating whether this Note is archived (also known as hidden or deleted).  When you call
  # [ArchiveNote](https://developer.lockstep.io/reference/delete_api-v1-notes-id) this field will
  # be set to true.
  #             
  # You should avoid displaying Notes with the IsArchived field set to true in your user interface.
  # @type: boolean
  field :is_archived

  # The date the note was created
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The unique ID of the [UserAccount](https://developer.lockstep.io/docs/useraccountmodel) of the user
  # who created this Note.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date this note was last modified
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID of the user who last modified this note
  # @type: string
  # @format: uuid
  field :modified_user_id

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
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}


end