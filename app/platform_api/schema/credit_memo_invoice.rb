class Schema::CreditMemoInvoice < Lockstep::ApiRecord

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

  # The base currency code of the group.
  # @type: string
  field :base_currency_code

  # The currency code of the credit memo invoice.
  # @type: string
  field :currency_code

  # The unique ID of this record, automatically assigned by ADS when this record is
  # added to the ADS Platform.
  # @type: string
  # @format: uuid
  field :credit_memo_applied_id

  # The id of the invoice
  # @type: string
  # @format: uuid
  field :invoice_id

  # The id of the credit memo invoice
  # @type: string
  # @format: uuid
  field :credit_memo_invoice_id

  # Date invoice applied to credit memo.
  # @type: string
  # @format: date
  field :apply_to_invoice_date

  # Amount applied to credit memo.
  # @type: number
  # @format: double
  field :credit_memo_applied_amount

  # The amount applied to credit memo in the group's base currency.
  # @type: number
  # @format: double
  field :base_currency_credit_memo_applied_amount

  # An additional reference code that is sometimes used to identify this invoice.
  # The meaning of this field is specific to the ERP or accounting system used by the user.
  # @type: string
  field :reference_code

  # The ID number of the company that created this invoice.
  # @type: string
  # @format: uuid
  field :company_id

  # The ID number of the counterparty for the invoice, for example, a customer or vendor.
  # @type: string
  # @format: uuid
  field :customer_id

  # A code identifying the status of this invoice.
  # @type: string
  field :invoice_status_code

  # The total value of this invoice, inclusive of all taxes and line items.
  # @type: number
  # @format: double
  field :total_amount

  # The remaining balance value of this invoice.
  # @type: number
  # @format: double
  field :outstanding_balance_amount

  # The total value of this invoice, inclusive of all taxes and line items in the group's base currency.
  # @type: number
  # @format: double
  field :base_currency_total_amount

  # The remaining balance value of this invoice in the group's base currency.
  # @type: number
  # @format: double
  field :base_currency_outstanding_balance_amount

  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :customer, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}
  belongs_to :connection, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}


end