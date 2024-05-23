class Schema::CustomerSummary < Lockstep::ApiRecord

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

  # The unique ID of this company.
  # @type: string
  # @format: uuid
  field :company_id

  # The name of the company.
  # @type: string
  field :company_name

  # The name of the primary contact.
  # @type: string
  field :primary_contact

  # The app enrollment ID this Customer is associated with
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # The number of outstanding invoices for this customer.
  # @type: integer
  # @format: int32
  field :outstanding_invoices

  # The number of open invoices.
  # @type: integer
  # @format: int32
  field :total_invoices_open

  # The number of past due invoices.
  # @type: integer
  # @format: int32
  field :total_invoices_past_due

  # The number of closed invoices for this customer.
  # @type: integer
  # @format: int32
  field :closed_invoices

  # The number of closed invoices for this customer in the past thirty days.
  # @type: integer
  # @format: int32
  field :closed_invoices_past_thirty_days

  # The total from collected payments.
  # @type: number
  # @format: double
  field :amount_collected

  # The total from collected payments in the past thirty days.
  # @type: number
  # @format: double
  field :amount_collected_past_thirty_days

  # The total balance of outstanding invoices.
  # @type: number
  # @format: double
  field :outstanding_amount

  # The total amount invoiced in the past thirty days.
  # @type: number
  # @format: double
  field :invoiced_amount_past_thirty_days

  # The total amount outstanding from the invoices invoiced in the past thirty days.
  # @type: number
  # @format: double
  field :outstanding_amount_past_thirty_days

  # The number of invoices invoiced in the past thirty days.
  # @type: integer
  # @format: int32
  field :invoices_past_thirty_days

  # The total amount past due for this customer.
  # @type: number
  # @format: double
  field :amount_past_due

  # The total value of unapplied Payments for this Customer.
  # @type: number
  # @format: double
  field :unapplied_payments

  # The total value of unapplied Payments for this Customer in the past thirty days.
  # @type: number
  # @format: double
  field :unapplied_amount_past_thirty_days

  # Portion of Total AR for this Customer that is Past due. (TotalPastDue / Total AR).
  # @type: number
  # @format: double
  field :percent_of_total_ar

  # Daily sales outstanding value for this Customer.
  # @type: number
  # @format: double
  field :dso

  # The date stamp for the newest Activity on this Customer.
  # @type: string
  # @format: date
  field :newest_activity

  # The modified date of the customer.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}


end