class Schema::ArHeaderInfo < Lockstep::ApiRecord

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

  # The base currency code of the group account
  # @type: string
  field :base_currency_code

  # The date of the report
  # @type: string
  # @format: date
  field :report_date

  # The date of the report
  # @type: string
  field :report_period

  # The total number of customers.
  # @type: integer
  # @format: int32
  field :total_customers

  # The total number of invoices.
  # @type: integer
  # @format: int32
  field :total_invoices

  # The total amount invoiced.
  # @type: number
  # @format: double
  field :total_invoiced_amount

  # The total number of unapplied payments.
  # @type: number
  # @format: double
  field :total_unapplied_payments

  # The total amount of collected payments.
  # @type: number
  # @format: double
  field :total_collected

  # The total accounts receivable amount.
  # @type: number
  # @format: double
  field :total_ar_amount

  # The number of paid invoices.
  # @type: integer
  # @format: int32
  field :total_invoices_paid

  # The number of past due invoices.
  # @type: integer
  # @format: int32
  field :total_invoices_past_due

  # The number of past due invoices for the last 90 days.
  # @type: integer
  # @format: int32
  field :total_invoices90_days_past_due

  # The total amount past due.
  # @type: number
  # @format: double
  field :total_past_due_amount

  # The total past due for the past 90 days.
  # @type: number
  # @format: double
  field :total_past_due_amount90_days

  # Portion of Total AR that is Past due.
  # @type: number
  # @format: double
  field :percentage_of_total_ar

  # Daily sales outstanding.
  # @type: number
  # @format: double
  field :dso

  # The total amount invoiced, due this year.
  # @type: number
  # @format: double
  field :total_invoice_amount_current_year

  # The total amount invoiced, due last year.
  # @type: number
  # @format: double
  field :total_invoice_amount_previous_year

  # The total of all payments received this year.
  # @type: number
  # @format: double
  field :total_payment_amount_current_year

  # Portion of Total AR that is 90+ days Past due.
  # @type: number
  # @format: double
  field :percentage_of_total_ar90_days_past_due

  # The number of customers who paid within the past thirty days.
  # @type: integer
  # @format: int32
  field :customers_paid_past_thirty_days

  # The total amount collected over the past thirty days.
  # @type: number
  # @format: double
  field :amount_collected_past_thirty_days

  # The amount unapplied from the payments collected over the past thirty days.
  # @type: number
  # @format: double
  field :unapplied_amount_past_thirty_days

  # The number of invoices paid over the past thirty days.
  # @type: integer
  # @format: int32
  field :invoices_paid_past_thirty_days

  # The number of customers invoiced over the the past thirty days.
  # @type: integer
  # @format: int32
  field :customers_invoiced_past_thirty_days

  # The total amount invoiced over the past thirty days.
  # @type: number
  # @format: double
  field :amount_invoiced_past_thirty_days

  # The amount outstanding on the invoices invoiced over the past thirty days.
  # @type: number
  # @format: double
  field :amount_due_past_thirty_days

  # The number of invoices invoiced over the past thirty days.
  # @type: integer
  # @format: int32
  field :invoices_past_thirty_days



end