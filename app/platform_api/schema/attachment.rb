class Schema::Attachment < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by ADS when this record is
  # added to the ADS Platform.
  # @type: string
  # @format: uuid
  field :attachment_id

  # The GroupKey uniquely identifies a single ADS Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # An Attachment is connected to an existing item within the ADS Platform by the fields `TableKey` and
  # `ObjectKey`.  For example, an Attachment connected to Invoice 12345 would have a `TableKey` value of
  # `Invoice` and an `ObjectKey` value of `12345`.
  #             
  # The `TableKey` value contains the name of the table within the ADS Platform to which this Attachment
  # is connected.
  #             
  # For more information, see [linking metadata to an object](https://developer.lockstep.io/docs/custom-fields#linking-metadata-to-an-object).
  # @type: string
  field :table_key

  # An Attachment is connected to an existing item within the ADS Platform by the fields `TableKey` and
  # `ObjectKey`.  For example, an Attachment connected to Invoice 12345 would have a `TableKey` value of
  # `Invoice` and an `ObjectKey` value of `12345`.
  #             
  # The `ObjectKey` value contains the primary key of the record within the ADS Platform to which this
  # Attachment is connected.
  #             
  # For more information, see [linking metadata to an object](https://developer.lockstep.io/docs/custom-fields#linking-metadata-to-an-object).
  # @type: string
  # @format: uuid
  field :object_key

  # An Attachment represents a file that was uploaded to the ADS Platform.  This field contains the original
  # name of the file on disk, without its extension.
  # @type: string
  field :file_name

  # An Attachment represents a file that was uploaded to the ADS Platform.  This field contains the original
  # extension name of the file on disk.
  # @type: string
  field :file_ext

  # A flag indicating whether this Attachment is archived (also known as hidden or deleted).  When you call
  # [ArchiveAttachment](https://developer.lockstep.io/reference/delete_api-v1-attachments-id) this field will
  # be set to true.
  #             
  # You should avoid displaying Attachments with the IsArchived field set to true in your user interface.
  # @type: boolean
  field :is_archived

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

  # The date the attachment was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The unique ID of the [UserAccount](https://developer.lockstep.io/docs/useraccountmodel) of the user
  # who created this Attachment.
  # @type: string
  # @format: uuid
  field :created_user_id

  # A text string describing the type of this Attachment.
  # @type: string
  field :attachment_type

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}


end