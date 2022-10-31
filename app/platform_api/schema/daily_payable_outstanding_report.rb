class Schema::DailyPayableOutstandingReport < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Timeframe (quarter) the daily payable outstanding values are associated with
  # @type: string
  # @format: date-time
  field :timeframe, Types::Params::DateTime

  # Number of invoices the average daily payable outstanding is calculated on
  # @type: integer
  # @format: int32
  field :invoice_count

  # Time (in days) between an invoice was completed paid off and when the invoice was issued
  # @type: number
  # @format: double
  field :daily_payable_outstanding



end