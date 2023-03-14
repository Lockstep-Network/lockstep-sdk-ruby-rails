class Schema::Amount < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Net amount of the payment after fees have been deducted by the servicer(s) involved.
  # @type: number
  # @format: double
  field :net_amount

  # Total fee amount applied to this payment by the servicer(s) involved.
  # @type: number
  # @format: double
  field :fee



end