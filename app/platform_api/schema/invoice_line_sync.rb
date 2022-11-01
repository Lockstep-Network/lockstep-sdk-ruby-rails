class Schema::InvoiceLineSync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

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

  # The line number of this line, as defined in the originating ERP or accounting system.  You can sort on this number to
  # get the original view of lines within the invoice.
  # @type: string
  field :line_number

  # A code number identifying the product or service that is specified on this line.
  # @type: string
  field :product_code

  # Description of this invoice line.
  # @type: string
  field :description

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

  # If this line is tax exempt, this code indicates the reason for the exemption.
  # @type: string
  field :exemption_code

  # If null, the products specified on this line were delivered on the same date as all other lines.
  # If not null, this line was delivered or finalized on a different date than the overall invoice.
  # @type: string
  # @format: date-time
  field :reporting_date, Types::Params::DateTime

  # Origination address for this invoice line, if this line item was originated from a different address
  # @type: string
  field :origin_address_line1

  # Origination address for this invoice line, if this line item was originated from a different address
  # @type: string
  field :origin_address_line2

  # Origination address for this invoice line, if this line item was originated from a different address
  # @type: string
  field :origin_address_line3

  # Origination address for this invoice line, if this line item was originated from a different address
  # @type: string
  field :origin_address_city

  # Origination address for this invoice line, if this line item was originated from a different address
  # @type: string
  field :origin_address_region

  # Origination address for this invoice line, if this line item was originated from a different address
  # @type: string
  field :origin_address_postal_code

  # Origination address for this invoice line, if this line item was originated from a different address
  # @type: string
  field :origin_address_country

  # Origination address for this invoice line, if this line item was originated from a different address
  # @type: number
  # @format: float
  field :origin_address_latitude

  # Origination address for this invoice line, if this line item was originated from a different address
  # @type: number
  # @format: float
  field :origin_address_longitude

  # Billing address for this invoice line, if this line item is to be billed to a different address
  # @type: string
  field :bill_to_address_line1

  # Billing address for this invoice line, if this line item is to be billed to a different address
  # @type: string
  field :bill_to_address_line2

  # Billing address for this invoice line, if this line item is to be billed to a different address
  # @type: string
  field :bill_to_address_line3

  # Billing address for this invoice line, if this line item is to be billed to a different address
  # @type: string
  field :bill_to_address_city

  # Billing address for this invoice line, if this line item is to be billed to a different address
  # @type: string
  field :bill_to_address_region

  # Billing address for this invoice line, if this line item is to be billed to a different address
  # @type: string
  field :bill_to_address_postal_code

  # Billing address for this invoice line, if this line item is to be billed to a different address
  # @type: string
  field :bill_to_address_country

  # Billing address for this invoice line, if this line item is to be billed to a different address
  # @type: number
  # @format: float
  field :bill_to_address_latitude

  # Billing address for this invoice line, if this line item is to be billed to a different address
  # @type: number
  # @format: float
  field :bill_to_address_longitude

  # Shipping address for this invoice line, if this line item is to be shipped to a different address
  # @type: string
  field :ship_to_address_line1

  # Shipping address for this invoice line, if this line item is to be shipped to a different address
  # @type: string
  field :ship_to_address_line2

  # Shipping address for this invoice line, if this line item is to be shipped to a different address
  # @type: string
  field :ship_to_address_line3

  # Shipping address for this invoice line, if this line item is to be shipped to a different address
  # @type: string
  field :ship_to_address_city

  # Shipping address for this invoice line, if this line item is to be shipped to a different address
  # @type: string
  field :ship_to_address_region

  # Shipping address for this invoice line, if this line item is to be shipped to a different address
  # @type: string
  field :ship_to_address_postal_code

  # Shipping address for this invoice line, if this line item is to be shipped to a different address
  # @type: string
  field :ship_to_address_country

  # Shipping address for this invoice line, if this line item is to be shipped to a different address
  # @type: number
  # @format: float
  field :ship_to_address_latitude

  # Shipping address for this invoice line, if this line item is to be shipped to a different address
  # @type: number
  # @format: float
  field :ship_to_address_longitude

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