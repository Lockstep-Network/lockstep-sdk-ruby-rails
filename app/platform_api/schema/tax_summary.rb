class Schema::TaxSummary < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The tax code for this invoice
  # @type: string
  field :tax_code

  # The tax rate for this invoice
  # @type: number
  # @format: double
  field :tax_rate

  # The tax total for this invoice
  # @type: number
  # @format: double
  field :tax_total

  # The base currency tax total for this invoice
  # @type: number
  # @format: double
  field :base_currency_tax_total



end