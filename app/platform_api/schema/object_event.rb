class Schema::ObjectEvent < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Identifier for event
  # @type: string
  field :id

  # Identifies the context in which this event happened
  # @type: string
  field :source

  # Version of the CloudEvents specification which the event uses
  # @type: string
  field :spec_version

  # Value describing the type of even relating to the originating occurrence
  # NOTE: Type format should be {entity type}.{event action}
  # @type: string
  field :type

  # Contains trace information such as version, trace ID, span ID and trace options
  # @type: string
  field :trace_parent

  # Comma-delimited list of trace key value pairs
  # @type: string
  field :trace_state

  # Content type of data value
  # @type: string
  field :data_content_type

  # Identifies the schema the data value adheres to
  # @type: string
  field :data_schema

  # Identifies the subject of the event in the context of the even producer (identified by source)
  # @type: string
  field :subject

  # Timestamp of when the occurrence happened
  # @type: string
  # @format: date-time
  field :time, Types::Params::DateTime

  # Subscription id related to the notification
  # @type: string
  field :subscription_id

  # Account id related to the notification
  # @type: string
  field :account_id

  # Dataset related to the notification
  # @type: string
  # @format: uuid
  field :dataset_id

  # Source domain-specific information about the occurrence to be deserialized based on the information in DataContentType
  # or DataSchema or by default content type - application/json
  field :data



end