class Schema::CompanyIdentifier < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The type of identifier.
  # @type: string
  field :type

  # The value of the identifier.
  # @type: string
  field :value

  # The jurisdiction of the identifier.
  # @type: string
  field :jurisdiction

  # The sub-jurisdiction of the identifier, ISO3166-1 or ISO3166-2 code.
  # @type: string
  field :subjurisdiction



end