class Schema::CreditMemoAppliedSync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # This is the primary key of the Credit Memo Application record. For this field, you should use whatever this
  # transaction's unique identifying number is in the originating system. Search for a unique, non-changing
  # number within the originating financial system for this record.
  #             
  # Since Credit Memo Applications are often considered transactions, a typical value to look for will be
  # the transaction ID number, the payment confirmation number, or some other record of this payment.
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # This field indicates which Invoice had its balanced reduced by applying a credit memo.  In this field,
  # identify the original primary key or unique ID of the Invoice which had its balanced reduced.
  #             
  # Example: Company ABC received a credit memo, CM000123 for $500.  Company ABC then chooses to apply this
  # credit memo to reduce the balance of the invoice PO1000578.  The `InvoiceErpKey` is `PO1000578`.
  # @type: string
  field :invoice_erp_key

  # This field indicates which Invoice is the original credit memo that was used to make this payment
  # application event.  In this field, identify the original primary key or unique ID of the Invoice which
  # created the credit memo that was consumed in this event.
  #             
  # Example: Company ABC received a credit memo, CM000123 for $500.  Company ABC then chooses to apply this
  # credit memo to reduce the balance of the invoice PO1000578.  The `CreditMemoInvoiceErpKey` is `CM000123`.
  # @type: string
  field :credit_memo_invoice_erp_key

  # Reference number for the applied credit memo.
  # @type: integer
  # @format: int32
  field :entry_number

  # The date on which this credit memo was applied to the Invoice.
  # @type: string
  # @format: date-time
  field :apply_to_invoice_date, Types::Params::DateTime

  # The amount of this credit memo that was applied to this Invoice.
  # @type: number
  # @format: double
  field :credit_memo_applied_amount

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