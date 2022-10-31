class Schema::InvoiceSummaryTotals < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The total amount invoiced.
  # @type: number
  # @format: double
  field :total_invoice_amount

  # The total outstanding balance
  # @type: number
  # @format: double
  field :total_invoice_balance



end