class Schema::CurrencyRate < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The source currency
  # @type: string
  field :source_currency

  # The destination currency
  # @type: string
  field :destination_currency

  # The date for the currency rate
  # @type: string
  # @format: date
  field :date

  # The currency rate value
  # @type: number
  # @format: double
  field :currency_rate



end