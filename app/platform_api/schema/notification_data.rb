class Schema::NotificationData < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The id of the subscription due to which this notification has been sent
  # @type: string
  field :subscription_id

  # The client application identifier
  # @type: string
  field :application_id

  # Application unique identifier for this company
  # @type: string
  # @format: uuid
  field :external_id

  # Unknown
  # @type: string
  field :network_id

  # expirationDateTime if the subscription has one
  # @type: string
  # @format: date-time
  field :expiration_date_time, Types::Params::DateTime

  # Specific info about this event
  # @type: object
  field :service_attributes



end