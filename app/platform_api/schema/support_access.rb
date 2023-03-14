class Schema::SupportAccess < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The code required to assist the user.
  # @type: string
  field :code

  # The UTC date and time when the support access will expire.
  # @type: string
  # @format: date-time
  field :expires_at, Types::Params::DateTime



end