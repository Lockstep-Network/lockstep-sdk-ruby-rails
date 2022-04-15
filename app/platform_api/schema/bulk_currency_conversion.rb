class Schema::BulkCurrencyConversion < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The date for the currency rate
  # @type: string
  # @format: date
  field :date

  # The currency code This will be validated by the /api/v1/currencies data set
  # @type: string
  field :source_currency



end