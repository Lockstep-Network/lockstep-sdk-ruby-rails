class Schema::Metadata < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Markup for emails that will cause an Actionable Message Card to be presented in Outlook clients for this payment.
  # @type: string
  field :outlook



end