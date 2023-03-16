class Schema::AttachmentLink < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The unique ID of an attachment record, automatically assigned by Lockstep when this record is
  # added to the Lockstep platform.
  # @type: string
  # @format: uuid
  field :attachment_id

  # An Attachment is connected to an existing item within the Lockstep Platform by the fields `TableKey` and
  # `ObjectKey`.  For example, an Attachment connected to Invoice 12345 would have a `TableKey` value of
  # `Invoice` and an `ObjectKey` value of `12345`.
  #             
  # The `ObjectKey` value contains the primary key of the record within the Lockstep Platform to which this
  # Attachment is connected.
  #             
  # For more information, see [linking metadata to an object](https://developer.lockstep.io/docs/custom-fields#linking-metadata-to-an-object).
  # @type: string
  # @format: uuid
  field :object_key

  # An Attachment is connected to an existing item within the Lockstep Platform by the fields `TableKey` and
  # `ObjectKey`.  For example, an Attachment connected to Invoice 12345 would have a `TableKey` value of
  # `Invoice` and an `ObjectKey` value of `12345`.
  #             
  # The `TableKey` value contains the name of the table within the Lockstep Platform to which this Attachment
  # is connected.
  #             
  # For more information, see [linking metadata to an object](https://developer.lockstep.io/docs/custom-fields#linking-metadata-to-an-object).
  # @type: string
  field :table_key

  # The date the Attachment Link was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The unique ID of the [UserAccount](https://developer.lockstep.io/docs/useraccountmodel) of the user
  # who created this Attachment Link.
  # @type: string
  # @format: uuid
  field :created_user_id

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}


end