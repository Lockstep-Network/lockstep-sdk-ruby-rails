class Schema::Attachment < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Lockstep when this record is
  # added to the Lockstep platform.
  # @type: string
  # @format: uuid
  field :attachment_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The name of the table the attachment is associated with
  # @type: string
  field :table_key

  # The ID of the object the attachment is associated with
  # @type: string
  # @format: uuid
  field :object_key

  # Name of the file
  # @type: string
  field :file_name

  # Extension type of the file
  # @type: string
  field :file_ext

  # Corresponding AttachmentType object to describe this attachment
  # @type: string
  # @format: uuid
  field :attachment_type_id

  # Flag indicating the attachment was archived
  # @type: boolean
  field :is_archived

  # Tracks the original record for this attachment, not currently used.
  # @type: string
  # @format: uuid
  field :origin_attachment_id

  # Flag for if LS clients can see this file
  # @type: boolean
  field :view_internal

  # Flag for if Vendors and customers can see this file
  # @type: boolean
  field :view_external

  # The unique ID of this record as it was known in its originating financial system.
  #             
  # If this company record was imported from a financial system, it will have the value `ErpKey`
  # set to the original primary key number of the record as it was known in the originating financial
  # system.  If this record was not imported from a financial system, this value will be `null`.
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # The AppEnrollmentId of the application that imported this record.  For accounts
  # with more than one financial system connected, this field identifies the originating
  # financial system that produced this record.  This value is null if this record
  # was not loaded from an external ERP or financial system.
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # The date the attachment was created
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # Id of the user who made the file
  # @type: string
  # @format: uuid
  field :created_user_id

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}


end