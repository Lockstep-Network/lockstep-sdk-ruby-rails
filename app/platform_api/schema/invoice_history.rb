class Schema::InvoiceHistory < Lockstep::ApiRecord

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

  # The unique ID number of this invoice history entry.
  # @type: string
  # @format: uuid
  field :invoice_history_id

  # The unique ID of the Invoice represented by this history entry.  This ID was automatically assigned
  # by Lockstep to the Invoice record when it was added to the Lockstep platform.
  #             
  # For the ID of this record in its originating financial system, see `ErpKey`.
  # @type: string
  # @format: uuid
  field :invoice_id

  # The ID number of the company that created this invoice.
  # @type: string
  # @format: uuid
  field :company_id

  # The ID number of the counterparty for the invoice, for example, a customer or vendor.
  # @type: string
  # @format: uuid
  field :customer_id

  # The unique ID of this record as it was known in its originating financial system.
  #             
  # If this company record was imported from a financial system, it will have the value `ErpKey`
  # set to the original primary key number of the record as it was known in the originating financial
  # system.  If this record was not imported, this value will be `null`.
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # The purchase order code as it exists in the user's ERP or accounting system.
  # @type: string
  field :purchase_order_code

  # An additional reference code that is sometimes used to identify this invoice.
  # The meaning of this field is specific to the ERP or accounting system used by the user.
  # @type: string
  field :reference_code

  # A code identifying the salesperson responsible for writing this invoice.
  # @type: string
  field :salesperson_code

  # A string identifying the salesperson responsible for writing this invoice.
  # @type: string
  field :salesperson_name

  # A code identifying the type of this invoice.
  # @type: string
  field :invoice_type_code

  # A code identifying the status of this invoice.
  # @type: string
  field :invoice_status_code

  # A code identifying the terms given to the purchaser.
  # @type: string
  field :terms_code

  # If the customer negotiated any special terms different from the standard terms above, describe them here.
  # @type: string
  field :special_terms

  # The three-character ISO 4217 currency code used for this invoice. This will be validated by the /api/v1/definitions/currencies data set
  # @type: string
  field :currency_code

  # The total value of this invoice, inclusive of all taxes and line items.
  # @type: number
  # @format: double
  field :total_amount

  # The total sales (or transactional) tax calculated for this invoice.
  # @type: number
  # @format: double
  field :sales_tax_amount

  # The total discounts given by the seller to the buyer on this invoice.
  # @type: number
  # @format: double
  field :discount_amount

  # The remaining balance value of this invoice.
  # @type: number
  # @format: double
  field :outstanding_balance_amount

  # The reporting date for this invoice.
  # @type: string
  # @format: date
  field :invoice_date

  # The date when discounts were adjusted for this invoice.
  # @type: string
  # @format: date
  field :discount_date

  # The date when this invoice posted to the company's general ledger.
  # @type: string
  # @format: date
  field :posted_date

  # The date when the invoice was closed and finalized after completion of all payments and delivery of all products and
  # services.
  # @type: string
  # @format: date
  field :invoice_closed_date

  # The date when the remaining outstanding balance is due.
  # @type: string
  # @format: date
  field :payment_due_date

  # The date and time when this record was imported from the user's ERP or accounting system.
  # @type: string
  # @format: date-time
  field :imported_date, Types::Params::DateTime

  # The ID number of the invoice's origination address
  # @type: string
  # @format: uuid
  field :primary_origin_address_id

  # The ID number of the invoice's bill-to address
  # @type: string
  # @format: uuid
  field :primary_bill_to_address_id

  # The ID number of the invoice's ship-to address
  # @type: string
  # @format: uuid
  field :primary_ship_to_address_id

  # The date on which this invoice record was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID number of the user who created this invoice.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date on which this invoice record was last modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID number of the user who most recently modified this invoice.
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

  # The Currency Rate used to get from the account's base currency to the invoice amount.
  # @type: number
  # @format: double
  field :currency_rate

  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :customer, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}
  belongs_to :connection, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}
  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}


end