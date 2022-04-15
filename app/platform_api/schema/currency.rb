class Schema::Currency < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Alphabetic code for the given currency
  # @type: string
  field :alpha_code

  # Numeric code for the given currency
  # @type: string
  field :numeric_code

  # Name of currency
  # @type: string
  field :currency_name

  # Number of places after the decimal for this currency
  # @type: integer
  # @format: int32
  field :minor_unit

  # Symbol for the given currency
  # @type: string
  field :symbol



end