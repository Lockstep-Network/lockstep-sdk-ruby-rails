class Schema::ApAgingHeaderInfo < Lockstep::ApiRecord

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

  # The aging bucket this data belongs to.
  # @type: string
  field :report_bucket

  # The total number of customers.
  # @type: integer
  # @format: int32
  field :total_vendors

  # The total number of invoices outstanding.
  # @type: integer
  # @format: int32
  field :total_bills_outstanding

  # The total amount outstanding.
  # @type: number
  # @format: double
  field :total_bills_outstanding_amount

  # The total credit memo amount outstanding.
  # @type: number
  # @format: double
  field :total_credit_memo_outstanding_amount

  # The total advance payment amount.
  # @type: number
  # @format: double
  field :total_advance_payment_amount

  # The total outstanding amount
  # @type: number
  # @format: double
  field :total_outstanding_amount

  # The total amount for AR.
  # @type: number
  # @format: double
  field :total_ap_amount

  # Portion of Total AR this data represents.
  # @type: number
  # @format: double
  field :percentage_of_total_ap
end
