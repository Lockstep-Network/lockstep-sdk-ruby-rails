class Schema::WebhookRule < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Accounting Data Service when this record is
  # added to the Accounting Data Service.
  # @type: string
  # @format: uuid
  field :webhook_rule_id

  # The unique Webhook ID that will be used to fire the webhook for this rule.
  # @type: string
  # @format: uuid
  field :webhook_id

  # The GroupKey uniquely identifies a single Accounting Data Service account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # A Webhook rule is setup to be fired based on `TableKey` and `EventType`.
  # For example, a Webhook setup for when an Invoice is Created would have a `TableKey` value of
  # `Invoice` and an `EventType` value of `I` (Insert).
  #             
  # The `TableKey` value contains the name of the table within the Accounting Data Service to which this metadata
  # is connected.
  #             
  # For more information, see [linking metadata to an object](https://developer.lockstep.io/docs/custom-fields#linking-metadata-to-an-object).
  # @type: string
  field :table_key

  # A Webhook rule is setup to be fired based on `TableKey` and `EventType`.
  # For example, a Webhook setup for when an Invoice is Created would have a `TableKey` value of
  # `Invoice` and an `EventType` value of `I` (Insert).
  #             
  # The `EventType` value is one of the following:
  # - I (Insert)
  # - D (Delete)
  # - U (Update)
  #             
  # For more information, see [linking metadata to an object](https://developer.lockstep.io/docs/custom-fields#linking-metadata-to-an-object).
  # @type: string
  field :event_type

  # An optional Searchlight filter for this webhook rule. See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
  # @type: string
  field :filter

  # The date this webhook rule was created
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID of the user who created this webhook rule
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date this webhook rule was last modified
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID of the user who last modified this webhook rule
  # @type: string
  # @format: uuid
  field :modified_user_id

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}


end