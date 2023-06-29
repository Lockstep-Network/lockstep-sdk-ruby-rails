class Schema::InsertPaymentRequest < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The AppEnrollmentId of the application to write this record to.
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # The unique ID of this record, automatically assigned by Lockstep when this record is
  # added to the Lockstep platform.
  #             
  # For the ID of this record in its originating financial system, see `ErpKey`.
  # @type: string
  # @format: uuid
  field :payment_id

  # The ID of the company to which this payment belongs.
  # @type: string
  # @format: uuid
  field :company_id

  # The ERP key for the company to which this payment belongs.
  # @type: string
  field :company_erp_key

  # A additional reference that may be used in the ERP
  # @type: string
  field :company_external_reference

  # The unique ID of this record as it was known in its originating financial system.
  #             
  # If this company record was imported from a financial system, it will have the value `ErpKey`
  # set to the original primary key number of the record as it was known in the originating financial
  # system.  If this record was not imported, this value will be `null`.
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

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

  # Memo or reference text (ex. memo field on a check).
  # @type: string
  field :memo_text

  # The date when this payment was received.
  # @type: string
  # @format: date-time
  field :payment_date, Types::Params::DateTime

  # The date when a payment was posted to a ledger.
  # @type: string
  # @format: date-time
  field :post_date, Types::Params::DateTime

  # Total amount of this payment in it's received currency.
  # @type: number
  # @format: double
  field :payment_amount

  # Unapplied balance of this payment in it's received currency.  If this amount is nonzero, the field `IsOpen` will be true.
  # @type: number
  # @format: double
  field :unapplied_amount

  # The ISO 4217 currency code for this payment.
  #             
  # For a list of ISO 4217 currency codes, see [Query Currencies](https://developer.lockstep.io/reference/get_api-v1-definitions-currencies).
  # @type: string
  field :currency_code

  # Reference code for the payment for the given Erp system.
  # @type: string
  field :reference_code

  # Is the payment voided?
  # @type: boolean
  field :is_voided

  # Is the payment in dispute?
  # @type: boolean
  field :in_dispute

  # The Currency Rate used to get from the account's base currency to the payment amount.
  # @type: number
  # @format: double
  field :currency_rate

  # Total amount of this payment in the group's base currency.
  # @type: number
  # @format: double
  field :base_currency_payment_amount

  # Unapplied balance of this payment in the group's base currency.  If this amount is nonzero, the field `IsOpen` will be true.
  # @type: number
  # @format: double
  field :base_currency_unapplied_amount

  # The Bank account id for the company to which this payment belongs.
  # @type: string
  field :bank_account_id

  # The GroupKey this request belongs to.
  # @type: string
  # @format: uuid
  field :group_key

  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}

  has_many :applications, {:class_name=>"Schema::InsertPaymentAppliedRequest", :included=>true}

end