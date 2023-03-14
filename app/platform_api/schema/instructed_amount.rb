class Schema::InstructedAmount < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The amount of the charge, in minor units (e.g. $10.50 would be sent as 1050).
  # @type: number
  # @format: double
  field :amount

  # The currency, in ISO 4217 format.
  # @type: string
  field :currency



end