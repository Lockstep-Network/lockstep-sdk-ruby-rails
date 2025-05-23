class Schema::InvoiceLineSync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Indicates what action to take when an existing object has been found during the sync process.
  field :on_match_action

  # The unique identifier of this object in the Accounting Data Service.
  # @type: string
  # @format: uuid
  field :network_id

  # This is the primary key of the Invoice Line record. For this field, you should use whatever the contact's unique
  # identifying number is in the originating system. Search for a unique, non-changing number within the
  # originating financial system for this record.
  #             
  # Example: If you store your invoice line records in a database, whatever the primary key for the invoice
  # line table is in the database should be the "ErpKey".
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # The original primary key or unique ID of the invoice to which this line belongs.  This value should
  # match the [Invoice ErpKey](https://developer.lockstep.io/docs/importing-invoices#erpkey) field on the
  # [InvoiceSyncModel](https://developer.lockstep.io/docs/importing-invoices).
  # @type: string
  field :invoice_erp_key

  # The network id of the parent Invoice.
  # @type: string
  # @format: uuid
  field :invoice_network_id

  # The line number of this line, as defined in the originating ERP or accounting system.  You can sort on this number to
  # get the original view of lines within the invoice.
  # @type: string
  field :line_number

  # The account number this line is associated with in the originating ERP or accounting system.
  # @type: string
  field :account_number

  # A code number identifying the product or service that is specified on this line.
  # @type: string
  field :product_code

  # Description of this invoice line.
  # @type: string
  field :description

  # The location to where specific items from an invoice will go.
  # @type: string
  field :location

  # For lines measured in a unit other than "quantity", this code indicates the measurement system for the quantity field.
  # If the line is measured in quantity, this field is null.
  # @type: string
  field :unit_measure_code

  # The price of a single unit for this line.
  # @type: number
  # @format: double
  field :unit_price

  # The quantity of items for ths line.
  # @type: number
  # @format: double
  field :quantity

  # The number of items that have been shipped.
  # @type: number
  # @format: double
  field :quantity_shipped

  # The number of items that has been received.
  # @type: number
  # @format: double
  field :quantity_received

  # The total amount for this line.
  # @type: number
  # @format: double
  field :total_amount

  # The tax code used for taxation on this line.
  # @type: string
  field :tax_code

  # The taxation rate for this line.
  # @type: number
  # @format: double
  field :tax_rate

  # The amount of sales tax for this line in the transaction's currency.
  # @type: number
  # @format: double
  field :sales_tax_amount

  # The amount of sales tax for this line in the base currency.
  # @type: number
  # @format: double
  field :base_currency_sales_tax_amount

  # The total value of this invoice line with deductions, excluding taxes.
  # @type: number
  # @format: double
  field :net_amount

  # The total value of this invoice line with deductions, excluding taxes and in the invoice's base currency.
  # @type: number
  # @format: double
  field :base_currency_net_amount

  # If this line is tax exempt, this code indicates the reason for the exemption.
  # @type: string
  field :exemption_code

  # Unique identifier for tax purposes, used for reference, validation, or compliance.
  # @type: string
  field :tax_uid

  # If null, the products specified on this line were delivered on the same date as all other lines.
  # If not null, this line was delivered or finalized on a different date than the overall invoice.
  # @type: string
  # @format: date-time
  field :reporting_date, Types::Params::DateTime

  # If known, the date when this record was created according to the originating financial system
  # in which this record is maintained.  If the originating financial system does not maintain a
  # created-date, leave this field null.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # If known, the date when this record was most recently modified according to the originating
  # financial system in which this record is maintained.  If the originating financial system does
  # not maintain a most-recently-modified-date, leave this field null.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime



end