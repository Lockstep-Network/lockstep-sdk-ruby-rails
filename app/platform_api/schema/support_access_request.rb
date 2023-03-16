class Schema::SupportAccessRequest < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The UTC date and time when support access should expire.
  # @type: string
  # @format: date-time
  field :expires_at, Types::Params::DateTime



end