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

  # The type of payment, Payment or AP Payment.
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

  # The name of the customer for this payment.
  # @type: string
  field :customer_name

  # The id of the customer for this payment.
  # @type: string
  # @format: uuid
  field :customer_id

  belongs_to :customer, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}
  belongs_to :connection, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}


end