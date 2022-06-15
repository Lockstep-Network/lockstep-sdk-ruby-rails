class Schema::PayableSummaryReport < Lockstep::ApiRecord

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

  # Timeframe in days the cashflow report is generated on
  # @type: integer
  # @format: int32
  field :timeframe

  # Number of payments made based in the timeframe
  # @type: number
  # @format: double
  field :total_payments_amount

  # Number of payments collected based in the timeframe
  # @type: integer
  # @format: int32
  field :total_payments_count

  # Amount of bills received based in the timeframe
  # @type: number
  # @format: double
  field :total_amount_billed

  # Number of invoices billed in the timeframe
  # @type: integer
  # @format: int32
  field :total_bills_count
end
