class Schema::SfNotification < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Notification ID
  # @type: string
  # @format: uuid
  field :id

  # Source of the Notification
  # @type: string
  field :source

  # Version of Notification
  # @type: string
  field :spec_version

  # Describes event from Source
  # @type: string
  field :type

  # The ID of the type in question (ex. NewPayment type would have the subject be a PaymentId)
  # @type: string
  # @format: uuid
  field :subject

  # RFC 2046 format content type
  # @type: string
  field :data_content_type

  # Extra information about the event
  field :data



end