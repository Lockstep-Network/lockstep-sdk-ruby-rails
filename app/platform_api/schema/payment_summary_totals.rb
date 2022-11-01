class Schema::PaymentSummaryTotals < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The total amount paid.
  # @type: number
  # @format: double
  field :total_paid_amount

  # The total amount unapplied.
  # @type: number
  # @format: double
  field :total_unapplied_balance



end