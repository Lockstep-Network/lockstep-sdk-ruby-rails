class Schema::ReportingAmount < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Amount of the payment.
  field :amount

  # The currency ISO-4217 code.
  # @type: string
  field :currency

  # Rate used to convert instructedAmount to reportingAmount.
  # @type: number
  # @format: double
  field :conversion_rate

  # Reporting Date.
  # @type: string
  field :date_time

  # Date the funds will be made available.
  # @type: string
  field :funds_available_date_time



end