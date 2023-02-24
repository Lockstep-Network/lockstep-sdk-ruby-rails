class Schema::PaymentSummary < Lockstep::ApiRecord

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

  # The id of the payment
  # @type: string
  # @format: uuid
  field :payment_id

  # Memo or reference text (ex. memo field on a check).
  # @type: string
  field :memo_text

  # Reference code for the payment for the given Erp system.
  # @type: string
  field :reference_code

  # The tender type of payment (Cash, Check, etc.)
  # @type: string
  field :tender_type

  # The type of payment, AR Payment or AP Payment.
  # @type: string
  field :payment_type

  # The date of this payment.
  # @type: string
  # @format: date
  field :payment_date

  # Total amount of this payment.
  # @type: number
  # @format: double
  field :payment_amount

  # Unapplied balance of this payment.
  # @type: number
  # @format: double
  field :unapplied_amount

  # True if this payment includes some unassigned amount that has not yet been applied to an invoice.  If this
  # value is true, the field `UnappliedAmount` will be nonzero.
  # @type: boolean
  field :is_open

  # The number of invoices associated to this payment.
  # @type: integer
  # @format: int32
  field :invoice_count

  # The number of payments applied to this payment.
  # @type: number
  # @format: double
  field :total_payments_applied

  # The reference codes of the invoices associated to this payment.
  # @type: array
  field :invoice_list

  # The ids of the invoices associated to this payment.
  # @type: array
  field :invoice_id_list

  # The id of the company for this payment.
  # @type: string
  # @format: uuid
  field :payment_company_id

  # The name of the company for this payment.
  # @type: string
  field :payment_company_name

  # Specific payments have support for pdf retrieval from their respective erp. When this flag is true, an additional
  # call to Payments/{id}/pdf can be made to retrieve a pdf directly from the erp.
  # @type: boolean
  field :supports_erp_pdf_retrieval

  # The ids of the customer for the associated invoices.
  # @type: array
  field :customer_ids

  # The names of the customer for the associated invoices.
  # @type: array
  field :customer_names

  # The ids of the company for the associated invoices.
  # @type: array
  field :company_ids

  # The names of the company for the associated invoices.
  # @type: array
  field :company_names

  # The base currency code of the group.
  # @type: string
  field :base_currency_code

  # The payment amount in the group's base currency.
  # @type: number
  # @format: double
  field :base_currency_payment_amount

  # The unapplied amount in the group's base currency.
  # @type: number
  # @format: double
  field :base_currency_unapplied_amount

  # The modified date of the payment
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime



end