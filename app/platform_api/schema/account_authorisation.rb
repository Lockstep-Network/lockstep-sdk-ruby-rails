class Schema::AccountAuthorisation < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # A URL that can be used to complete account activation at the servicer.
  # @type: string
  field :activation_link



end