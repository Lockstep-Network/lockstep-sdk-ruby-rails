class Schema::ActivityStreamItem < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The object key of the activity stream item.
  # @type: string
  # @format: uuid
  field :object_key

  # The type code of the activity stream item.
  # @type: string
  field :activity_stream_type

  # The text body description for this Activity Stream Item.
  # @type: string
  field :text_value

  # The date on which this activity stream item was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID of the user who created this activity.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The sender's email address if activity stream item is an Email.
  # @type: string
  field :from_email_address

  # The recipient's email address if activity stream item is an Email.
  # @type: string
  field :to_email_address

  # The name of the contact sending the activity otherwise null.
  # @type: string
  field :from_contact_name

  # The name of the contact sending the activity otherwise null.
  # @type: string
  field :to_contact_name

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}


end