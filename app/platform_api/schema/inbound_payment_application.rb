class Schema::InboundPaymentApplication < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique identifier of this object in the Sage Network platform.
  # @type: string
  # @format: uuid
  field :network_id

  # The network id of the related Payment.
  # @type: string
  # @format: uuid
  field :payment_network_id

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

  # Nested invoice object
  field :invoice

  # The total amount that was applied to this Invoice from the Payment.
  # @type: number
  # @format: double
  field :payment_applied_amount



end