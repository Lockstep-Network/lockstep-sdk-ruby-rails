class Schema::Payment < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The GroupKey uniquely identifies a single ADS Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The unique ID of this record, automatically assigned by ADS Platform when this record is
  # added to the ADS Platform.
  #             
  # For the ID of this record in its originating financial system, see `ErpKey`.
  # @type: string
  # @format: uuid
  field :payment_id

  # The ID of the company to which this payment belongs.
  # @type: string
  # @format: uuid
  field :company_id

  # The unique ID of this record as it was known in its originating financial system.
  #             
  # If this company record was imported from a financial system, it will have the value `ErpKey`
  # set to the original primary key number of the record as it was known in the originating financial
  # system.  If this record was not imported, this value will be `null`.
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # Possible statuses for a record that supports ERP Update.
  field :erp_update_status

  # Possible actions for a record that supports ERP Update.
  field :erp_update_action

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
  # @format: date
  field :payment_date

  # The date when a payment was posted to a ledger.  This date is often determined by a company's accounting
  # practices and may be different than the date when the payment was received.  This date may be affected by
  # issues such as temporary holds on funds transferred, bank holidays, or other actions.
  # @type: string
  # @format: date
  field :post_date

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

  # The Bank account id for the company to which this payment belongs.
  # @type: string
  field :bank_account_id

  # Reference code for the payment for the given Erp system.
  # @type: string
  field :reference_code

  # The date on which this record was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID of the user who created this payment.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date on which this record was last modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID of the user who last modified this payment.
  # @type: string
  # @format: uuid
  field :modified_user_id

  # The AppEnrollmentId of the application that imported this record.  For accounts
  # with more than one financial system connected, this field identifies the originating
  # financial system that produced this record.  This value is null if this record
  # was not loaded from an external ERP or financial system.
  # @type: string
  # @format: uuid
  field :app_enrollment_id

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

  # The status of this payment within Service Fabric.
  # "UNAUTHORISED" "PENDING" "PAID" "PAID_OFFLINE" "FAILED" "CANCELLED" "REJECTED" "REFUNDED" "PARTIALLY" "PARTIALLY_REFUNDED"
  # @type: string
  field :service_fabric_status

  # The date on which this record was last modified in source ERP.
  # @type: string
  # @format: date-time
  field :source_modified_date, Types::Params::DateTime

  # Additional attributes that may be required by the source system.
  # @type: object
  field :erp_system_attributes

  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}

  has_many :applications, {:class_name=>"Schema::PaymentApplied", :included=>true}
  has_many :notes, {:class_name=>"Lockstep::Note", :included=>true, :foreign_key=>:object_key, :polymorphic=>{:table_key=>"Payment"}}
  has_many :attachments, {:class_name=>"Schema::Attachment", :included=>true}
  has_many :custom_field_definitions, {:class_name=>"Schema::CustomFieldDefinition", :included=>true}
  has_many :custom_field_values, {:class_name=>"Schema::CustomFieldValue", :included=>true}

end