class Schema::Aging < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Aging bucket of outstanding balance data (days past due date of invoice)
  # @type: integer
  # @format: int32
  field :bucket

  # Currency code of aging bucket
  # @type: string
  field :currency_code

  # Outstanding balance for the given aging bucket
  # @type: number
  # @format: double
  field :outstanding_balance



end