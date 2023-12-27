class Schema::InboundSyncInvoiceLines < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique identifier of this object in the Sage Network platform.
  # @type: string
  # @format: uuid
  field :network_id

  # The GL account no to associate this line item with
  # @type: string
  field :account_no

  # The account label to associate this line item with
  # @type: string
  field :account_label

  # The department this line item belongs to.
  # @type: string
  field :department_erp_key

  # Description of this invoice line.
  # @type: string
  field :description

  # The line number of this line.
  # @type: string
  field :line_number

  # The location this line item belongs to.
  # @type: string
  field :location_erp_key

  # Offset account for this line item.
  # @type: string
  field :offset_gl_account_no

  # A code number identifying the product or service that is specified on this line.
  # @type: string
  field :product_code

  # The quantity of items for this line.
  # @type: number
  # @format: double
  field :quantity

  # For lines measured in a unit other than "quantity", this code indicates the measurement system for the quantity field.
  # If the line is measured in quantity, this field is null.
  # @type: string
  field :unit_measure_code

  # The price of a single unit for this line.
  # @type: number
  # @format: double
  field :unit_price

  # The total amount for this line.
  # @type: number
  # @format: double
  field :total_amount



end