class Schema::CashflowReport < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Timeframe in days the cashflow report is generated on
  # @type: integer
  # @format: int32
  field :timeframe

  # Amount of payments collected based in the timeframe
  # @type: number
  # @format: double
  field :payments_collected

  # Number of payments collected based in the timeframe
  # @type: integer
  # @format: int32
  field :payments_collected_count

  # Amount of invoices billed based in the timeframe
  # @type: number
  # @format: double
  field :invoices_billed

  # Number of invoices billed in the timeframe
  # @type: integer
  # @format: int32
  field :invoices_billed_count



end