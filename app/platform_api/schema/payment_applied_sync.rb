class Schema::PaymentAppliedSync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Indicates what action to take when an existing object has been found during the sync process.
  field :on_match_action

  # The unique identifier of this object in the Sage Network platform.
  # @type: string
  # @format: uuid
  field :network_id

  # This is the primary key of the Payment Application record. For this field, you should use whatever this
  # transaction's unique identifying number is in the originating system. Search for a unique, non-changing
  # number within the originating financial system for this record.
  #             
  # Since Payment Applications are often considered transactions, a typical value to look for will be
  # the transaction ID number, the payment confirmation number, or some other record of this payment.
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # This field indicates which Invoice had its balance reduced by applying this payment.  In this field,
  # identify the original primary key or unique ID of the Invoice which had its balance reduced.
  #             
  # This information lets you track how an invoice was paid. You can identify what proportion of an invoice's
  # balance was paid by which methods by joining this field to Invoices.
  #             
  # This value should match the [Invoice ErpKey](https://developer.lockstep.io/docs/importing-invoices#erpkey)
  # field on the [InvoiceSyncModel](https://developer.lockstep.io/docs/importing-invoices).
  # @type: string
  field :invoice_erp_key

  # The network id of the related Invoice.
  # @type: string
  # @format: uuid
  field :invoice_network_id

  # This field indicates which Payment was used to provide the funds for this payment application. In this
  # field, identify the original primary key or unique ID of the Payment that was used for this payment
  # application.
  #             
  # This information lets you track how an invoice was paid. You can identify what proportion of an payment's
  # balance was paid by which methods by joining this field to the Payment.
  #             
  # This value should match the [Payment ErpKey](https://developer.lockstep.io/docs/importing-payments#erpkey)
  # field on the [PaymentSyncModel](https://developer.lockstep.io/docs/importing-payments).
  # @type: string
  field :payment_erp_key

  # The network id of the related Payment.
  # @type: string
  # @format: uuid
  field :payment_network_id

  # The entry number of this payment application.  This is often a journal entry number, confirmation code,
  # or other identifying field for this payment application.
  # @type: integer
  # @format: int32
  field :entry_number

  # The date this payment was applied to this invoice.
  # @type: string
  # @format: date-time
  field :apply_to_invoice_date, Types::Params::DateTime

  # The total amount that was applied to this Invoice from the Payment.
  # @type: number
  # @format: double
  field :payment_applied_amount

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