class Schema::SummaryAgingTotals < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Aging bucket outstanding balance is associated to.
  # @type: string
  field :bucket

  # Aging outstanding balance value.
  # @type: number
  # @format: double
  field :outstanding_balance



end