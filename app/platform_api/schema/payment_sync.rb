class Schema::PaymentSync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Indicates what action to take when an existing object has been found during the sync process.
  field :on_match_action

  # This is the primary key of the Payment record. For this field, you should use whatever the payment's unique
  # identifying number is in the originating system. Search for a unique, non-changing number within the
  # originating financial system for this record.
  #             
  # Example: If you store your payment records in a database, whatever the primary key for the payment table is
  # in the database should be the "ErpKey".
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # The original primary key or unique ID of the company to which this payment belongs.  This value should
  # match the [Company ErpKey](https://developer.lockstep.io/docs/importing-companies#erpkey) field on the
  # [CompanySyncModel](https://developer.lockstep.io/docs/importing-companies).
  # @type: string
  field :company_erp_key

  # The type of payment, AR Payment or AP Payment.
  #             
  # Recognized PaymentType values are:
  # * `AR Payment` - A payment made by a Customer to the Company
  # * `AP Payment` - A payment made by the Company to a Vendor
  # @type: string
  field :payment_type

  # Cash, check, credit card, wire transfer.
  #             
  # Recognized TenderType values are:
  # * `Cash` - A cash payment or other direct transfer.
  # * `Check` - A check payment.
  # * `Credit Card` - A payment made via a credit card.
  # * `Wire Transfer` - A payment made via wire transfer from another financial institution.
  # * `Other` - A payment made via another method not listed above.
  # @type: string
  field :tender_type

  # True if this payment includes some unassigned amount that has not yet been applied to an invoice.  If this
  # value is true, the field `UnappliedAmount` will be nonzero.
  # @type: boolean
  field :is_open

  # Memo or reference text (ex. memo field on a check).
  # @type: string
  field :memo_text

  # The date when this payment was received.  This typically is the date when an accounting employee recorded
  # that they received notification that the payment had occurred, whether they were notified by email, postal
  # mail, or financial transaction notification.
  # @type: string
  # @format: date-time
  field :payment_date, Types::Params::DateTime

  # The date when a payment was posted to a ledger.  This date is often determined by a company's accounting
  # practices and may be different than the date when the payment was received.  This date may be affected by
  # issues such as temporary holds on funds transferred, bank holidays, or other actions.
  # @type: string
  # @format: date-time
  field :post_date, Types::Params::DateTime

  # Total amount of this payment in the payment's currency.
  # @type: number
  # @format: double
  field :payment_amount

  # Unapplied balance of this payment in the payment's currency.  If this amount is nonzero, the field `IsOpen` will be true.
  # @type: number
  # @format: double
  field :unapplied_amount

  # The ISO 4217 currency code for this payment.
  #             
  # For a list of ISO 4217 currency codes, see [Query Currencies](https://developer.lockstep.io/reference/get_api-v1-definitions-currencies).
  # @type: string
  field :currency_code

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

  # A reference code for the payment for the given financial or ERP system.  This can be any value that the
  # originating system uses to designate the payment, such as a confirmation number or tracking number, that
  # is different from the `ErpKey` value.
  # @type: string
  field :reference_code

  # True if this payment was voided.
  # @type: boolean
  field :is_voided

  # True if this payment is in dispute.
  # @type: boolean
  field :in_dispute

  # The Currency Rate used to get from the account's base currency to the payment amount.
  # @type: number
  # @format: double
  field :currency_rate

  # Total amount of this payment in the erp's base currency.
  # @type: number
  # @format: double
  field :base_currency_payment_amount

  # Unapplied balance of this payment in the erp's base currency.  If this amount is nonzero, the field `IsOpen` will be true.
  # @type: number
  # @format: double
  field :base_currency_unapplied_amount



end