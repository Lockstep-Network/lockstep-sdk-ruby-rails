class Schema::RemittanceInformation < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Reference, assigned by the creditor, to unambiguously refer to the payment transaction. For example, Invoice ID.
  # @type: string
  field :reference

  # Unstructured text, describes the invoice.
  # @type: string
  field :description



end