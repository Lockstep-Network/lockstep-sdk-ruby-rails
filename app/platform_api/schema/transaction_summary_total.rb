class Schema::TransactionSummaryTotal < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Total count of all transactions from the query request.
  # @type: integer
  # @format: int32
  field :total_count

  # Total value of all transactions from the query request.
  # @type: number
  # @format: double
  field :total_amount

  # Total outstanding amount value of all transactions from the query request.
  # @type: number
  # @format: double
  field :outstanding_amount

  # Total open invoice count from the query request.
  # @type: integer
  # @format: int32
  field :invoice_open_count

  # Total past due invoice count from the query request.
  # @type: integer
  # @format: int32
  field :invoice_past_due_count



end