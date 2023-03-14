class Schema::PaymentInstrument < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The WPB unique identifier for this instrument.
  # @type: string
  field :instrument_id

  # The servicer account that this instrument belongs to.
  # @type: string
  field :servicer_account_id

  # Enum: "CHARGEABLE" "PENDING" "CANCELLED" "EXPIRED" "FAILED"
  # The status of this payment instrument. This should be used in conjunction with
  # the availableForCharges property to establish the UI state of the instrument.
  # Some instruments (for example, GoCardless mandates) may be chargeable in a PENDING state, while others may not.
  field :instrument_status

  # Whether the payment instrument can be used for billing customers.
  # @type: boolean
  field :available_for_charges

  # Value: "DIRECT_DEBIT_MANDATE"
  # The type of this instrument. DIRECT_DEBIT_MANDATE is the only type currently defined.
  field :instrument_type

  # An optional set of ISO 4217 currency codes that the instrument can accept.
  # A null or empty value means there is no restriction.
  # @type: array
  field :allowed_currencies



end