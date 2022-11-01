class Schema::Webhook < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Lockstep when this record is
  # added to the Lockstep platform.
  # @type: string
  # @format: uuid
  field :webhook_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # A name for the webhook subscription.
  # @type: string
  field :name

  # The status of the webhook (Active, Inactive, Errored).
  # @type: string
  field :status_code

  # When the StatusCode is set to Errored a message is supplied for why it was errored.
  # @type: string
  field :status_message

  # An secret set during webhook creation that can be used to verify that the notification
  # is coming from the Lockstep API.
  # @type: string
  field :client_secret

  # The format of the content to be returned in the webhook notifications. Current options are 'Full' or 'Id'.
  # @type: string
  field :request_content_type

  # The HTTP Method to be used on the callback URL for use in notifications (GET, POST, PATCH, PUT).
  # @type: string
  field :callback_http_method

  # The URL where the notification will be sent via the method set in CallbackHttpMethod.
  #             
  # When creating a webhook, the Lockstep API will make a call to this url via the method
  # set in the CallbackHttpMethod property with a query parameter of "code" set to an encoded
  # string. To successfully create the webhook, the call must return a successful status code
  # with the query parameter's value as the plain text content.
  # @type: string
  # @format: uri
  field :callback_url

  # The expiration date for the given webhook subscription. Once the expiration date passes,
  # notifications will no longer be sent to the callback url.
  # @type: string
  # @format: date-time
  field :expiration_date, Types::Params::DateTime

  # The amount of consecutive failed notifications, not including the current attempt, before marking the webhook as
  # errored (i.e. if the value is set to 0, the webhook will be marked errored on the first failure, if the value
  # is set to 1 the webhook will be marked errored on the second failure, and so on). Use -1 to never mark the webhook
  # as errored due to failures.
  # @type: integer
  # @format: int32
  field :retry_count

  # The date this webhook was created
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID of the user who created this webhook
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date this webhook was last modified
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID of the user who last modified this webhook
  # @type: string
  # @format: uuid
  field :modified_user_id

  # The partition key used for the webhook callback history
  # @type: string
  field :partition_key

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}

  has_many :webhook_rules, {:class_name=>"Schema::WebhookRule", :included=>true}

end