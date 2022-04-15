class Schema::CustomFieldSync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # This is the primary key of the record to which you will attach this custom field. You should provide the
  # identifying number as it is stored in the originating financial system. Search for a unique, non-changing
  # number within the originating financial system for this record.
  #             
  # Custom Fields are identified by the `EntityType` and `ErpKey` values together.
  #             
  # Example: You have an invoice whose ID number is 100047878, and you wish to store a custom field on that
  # invoice named "ApprovalStatusCode".  For the `ErpKey` field, specify the value `100047878`.
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # Custom Fields are identified by the `EntityType` and `ErpKey` values together.
  #             
  # Example: You have an invoice whose ID number is 100047878, and you wish to store a custom field on that
  # invoice named "ApprovalStatusCode".  For the `EntityType` field, specify the value `Invoice`.
  #             
  # Recognized types include:
  # * `Company` - Link this custom field to a CompanySyncModel
  # * `Contact` - Link this custom field to a ContactSyncModel
  # * `Invoice` - Link this custom field to an InvoiceSyncModel
  # * `InvoiceLine` - Link this custom field to an InvoiceLineSyncModel
  # * `Payment` - Link this custom field to a PaymentSyncModel
  # @type: string
  field :entity_type

  # A label that uniquely identifies this custom field within your software.
  #             
  # Example: You have an invoice whose ID number is 100047878, and you wish to store a custom field on that
  # invoice named "ApprovalStatusCode".  For the `CustomFieldLabel` field, specify the value `ApprovalStatusCode`.
  # @type: string
  field :custom_field_label

  # The value of this custom field, if it is stored in string format.
  # @type: string
  field :string_value

  # The value of this custom field, if it is stored in numeric format.
  # @type: number
  # @format: double
  field :numeric_value

  # The value of this custom field.
  # @type: string
  field :value

  # If known, the date when this record was created according to the originating financial system
  # in which this record is maintained.  If the originating financial system does not maintain a
  # created-date, leave this field null.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # If known, the date when this record was most recently modified according to the originating
  # financial system in which this record is maintained.  If the originating financial system does
  # not maintain a most-recently-modified-date, leave this field null.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime



end