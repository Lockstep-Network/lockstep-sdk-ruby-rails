class Schema::SettlementDiscount < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The absolute amount to be discounted if this discount is applied. Not required if discountPercentage is provided.
  # @type: number
  # @format: double
  field :discount_amount

  # The relative amount to be discounted if this discount is applied. Not required if discountAmount is provided.
  # @type: number
  # @format: double
  field :discount_percentage

  # The date until the discount is valid.
  # @type: string
  # @format: date-time
  field :until_date_time, Types::Params::DateTime



end