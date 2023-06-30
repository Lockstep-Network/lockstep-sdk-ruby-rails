class Schema::InsertPaymentAppliedRequest < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Lockstep when this record is
  # added to the Lockstep platform.
  #             
  # For the ID of this record in its originating financial system, see `ErpKey`.
  # @type: string
  # @format: uuid
  field :payment_applied_id

  # The Invoice this payment is applied to.
  # @type: string
  # @format: uuid
  field :invoice_id

  # The Payment this application applies from.
  # @type: string
  # @format: uuid
  field :payment_id

  # The unique ID of this record as it was known in its originating financial system.
  #             
  # If this company record was imported from a financial system, it will have the value `ErpKey`
  # set to the original primary key number of the record as it was known in the originating financial
  # system.  If this record was not imported, this value will be `null`.
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # The ERP key of the Invoice this payment is applied to.
  # @type: string
  field :invoice_erp_key

  # The date this payment was applied to this invoice.
  # @type: string
  # @format: date-time
  field :apply_to_invoice_date, Types::Params::DateTime

  # The total amount that was applied to this Invoice from the Payment.
  # @type: number
  # @format: double
  field :payment_applied_amount



end

