class Schema::AtRiskInvoiceSummary < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The date of the report
  # @type: string
  # @format: date
  field :report_date

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The ID number of the counterparty for the invoice, for example, a customer or vendor.
  # @type: string
  # @format: uuid
  field :customer_id

  # The unique ID number of this invoice.
  # @type: string
  # @format: uuid
  field :invoice_id

  # A reference code that is used to identify this invoice.
  # The meaning of this field is specific to the ERP or accounting system used by the user.
  # @type: string
  field :invoice_number

  # The reporting date for this invoice.
  # @type: string
  # @format: date
  field :invoice_date

  # The name of the counterparty for the invoice, for example, a customer or vendor.
  # @type: string
  field :customer_name

  # The status of the invoice.
  # @type: string
  field :status

  # The due date of the invoice.
  # @type: string
  # @format: date
  field :payment_due_date

  # The total amount of the Invoice.
  # @type: number
  # @format: double
  field :invoice_amount

  # The remaining balance value of this invoice.
  # @type: number
  # @format: double
  field :outstanding_balance

  # A code identifying the type of this Invoice.
  # @type: string
  field :invoice_type_code

  # The date stamp for the newest Activity on this Invoice.
  # @type: string
  # @format: date
  field :newest_activity

  # The number of days this Invoice is past due.
  # @type: integer
  # @format: int32
  field :days_past_due

  # The memo text of the payments associated to this invoice.
  # @type: array
  field :payment_numbers

  # The ids of the payments associated to this invoice.
  # @type: array
  field :payment_ids

  belongs_to :customer, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}
  belongs_to :connection, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}


end