class Schema::DebtorAgentAccount < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Name of the identification scheme.
  # @type: string
  field :schema_name

  # The unique identifier of the underlying debtor account to which a debit entry will be made as a result of the transaction.
  # @type: string
  field :identification

  # Last 4 digits of real-world account.
  # @type: string
  field :last4_digits

  # Real-world account brand name (for example, Visa, Mastercard, PayPal and so on)
  # @type: string
  field :brand



end