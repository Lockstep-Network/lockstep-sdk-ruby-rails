class Schema::Meta < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Type of entity
  # @type: string
  field :type

  # UniqueID for entity
  # @type: string
  field :id



end