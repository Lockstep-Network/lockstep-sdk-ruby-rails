class Schema::ApHeaderInfo < Lockstep::ApiRecord

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

  # The date of the report
  # @type: string
  # @format: date
  field :report_period

  # The total number of vendors.
  # @type: integer
  # @format: int32
  field :total_vendors

  # The total number of bills.
  # @type: integer
  # @format: int32
  field :total_bills

  # The total amount billed.
  # @type: number
  # @format: double
  field :total_billed_amount

  # The total number of advance payments.
  # @type: number
  # @format: double
  field :total_advance_payments

  # The total amount paid.
  # @type: number
  # @format: double
  field :total_paid

  # The total accounts payable amount.
  # @type: number
  # @format: double
  field :total_ap_amount

  # The number of bills paid.
  # @type: integer
  # @format: int32
  field :total_bills_paid

  # The number of past due bills.
  # @type: integer
  # @format: int32
  field :total_bills_past_due

  # The number of bills 90+ days past due.
  # @type: integer
  # @format: int32
  field :total_bills90_days_past_due

  # The total amount past due.
  # @type: number
  # @format: double
  field :total_past_due_amount

  # The total past due for the past 90 days.
  # @type: number
  # @format: double
  field :total_past_due_amount90_days

  # Portion of Total AP that is Past due.
  # @type: number
  # @format: double
  field :percentage_of_total_ap

  # The total amount billed, due this year.
  # @type: number
  # @format: double
  field :total_billed_amount_current_year

  # The total amount billed, due last year.
  # @type: number
  # @format: double
  field :total_billed_amount_previous_year

  # The total of all payments made this year.
  # @type: number
  # @format: double
  field :total_paid_amount_current_year

  # Portion of Total AP that is 90+ days Past due.
  # @type: number
  # @format: double
  field :percentage_of_total_ap90_days_past_due

  # The number of vendors who were paid within the past thirty days.
  # @type: integer
  # @format: int32
  field :vendors_paid_past_thirty_days

  # The total amount paid over the past thirty days.
  # @type: number
  # @format: double
  field :amount_paid_past_thirty_days

  # The amount in advance from the payments made over the past thirty days.
  # @type: number
  # @format: double
  field :advance_payment_amount_past_thirty_days

  # The number of bills paid over the past thirty days.
  # @type: integer
  # @format: int32
  field :bills_paid_past_thirty_days

  # The number of vendors that sent bills over the the past thirty days.
  # @type: integer
  # @format: int32
  field :billing_vendors_past_thirty_days

  # The total amount billed over the past thirty days.
  # @type: number
  # @format: double
  field :amount_billed_past_thirty_days

  # The amount outstanding on the bills received over the past thirty days.
  # @type: number
  # @format: double
  field :amount_due_past_thirty_days

  # The number of bills received over the past thirty days.
  # @type: integer
  # @format: int32
  field :bills_past_thirty_days
end