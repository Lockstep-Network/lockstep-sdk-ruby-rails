class Schema::TransactionCurrencySummary < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The currency code for the summary.
  # @type: string
  field :currency_code

  # Total value of all transactions from the query request for the specified currency.
  # @type: number
  # @format: double
  field :total_amount

  # Total outstanding amount value of all transactions from the query request for the specified currency.
  # @type: number
  # @format: double
  field :outstanding_amount



end