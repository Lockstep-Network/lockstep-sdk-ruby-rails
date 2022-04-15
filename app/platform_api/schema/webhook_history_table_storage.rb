class Schema::WebhookHistoryTableStorage < Lockstep::ApiRecord

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

  # The WebhookId uniquely identifies the webhook used to send notification that an event action has taken place.
  # @type: string
  # @format: uuid
  field :webhook_id

  # The unique ID of this record, automatically assigned by Lockstep when this record is
  # added to the Lockstep platform.
  # @type: string
  # @format: uuid
  field :webhook_history_id

  # Event type which fired webhook
  #             
  # [entity].[action]
  # @type: string
  field :event_type

  # Flag whether request was sent to callback url successfully or blocked by failing or because it was disabled.
  # @type: boolean
  field :request_sent

  # Flag whether webhook notification was successful overall (if webhook disabled should always return true otherwise
  # depends on the response from the callback url)
  # @type: boolean
  field :is_successful

  # Response status code that is returned when calling a callback url.
  # @type: string
  field :response_status_code

  # Message containing information about the webhook callback results
  # @type: string
  field :process_result_message

  # Number of times message failed to be sent over to callback url before succeeding or failing out.
  # The maximum value should is based on webhook.
  # @type: integer
  # @format: int32
  field :failure_count

  # Timestamp of when a request is sent to a webhook callback.
  # Contains the last time message is sent if failures occur.
  # @type: string
  # @format: date-time
  field :timestamp, Types::Params::DateTime



end