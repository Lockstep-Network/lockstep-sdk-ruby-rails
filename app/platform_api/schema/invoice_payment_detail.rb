class Schema::InvoicePaymentDetail < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The GroupKey uniquely identifies a single Accounting Data Service account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The base currency code of the group.
  # @type: string
  field :base_currency_code

  # The payment's currency code.
  # @type: string
  field :currency_code

  # The unique identifier of this PaymentApplied record.
  # @type: string
  # @format: uuid
  field :payment_applied_id

  # The database id of the invoice
  # @type: string
  # @format: uuid
  field :invoice_id

  # The database id of the Payment.
  # @type: string
  # @format: uuid
  field :payment_id

  # Date Payment applied to Invoice.
  # @type: string
  # @format: date
  field :apply_to_invoice_date

  # Amount applied to Invoice.
  # @type: number
  # @format: double
  field :payment_applied_amount

  # Amount applied to Invoice in the group's base currency.
  # @type: number
  # @format: double
  field :base_currency_payment_applied_amount

  # An additional reference code that is sometimes used to identify this Payment.
  # The meaning of this field is specific to the ERP or accounting system used by the user.
  # @type: string
  field :reference_code

  # The ID number of the Company (CompanyType = "Customer") that created this Payment.
  # @type: string
  # @format: uuid
  field :company_id

  # The total value of this Payment.
  # @type: number
  # @format: double
  field :payment_amount

  # The remaining balance value of this Payment.
  # @type: number
  # @format: double
  field :unapplied_amount

  # The total value of this Payment in the group's base currency.
  # @type: number
  # @format: double
  field :base_currency_payment_amount

  # The remaining balance value of this Payment in the group's base currency.
  # @type: number
  # @format: double
  field :base_currency_unapplied_amount

  # Possible statuses for a record that supports ERP Update.
  field :erp_update_status

  # Possible actions for a record that supports ERP Update.
  field :erp_update_action

  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}


end