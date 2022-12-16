class Schema::BulkDeleteRequest < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Represents the IDs to be deleted
  # @type: array
  field :ids_to_delete



end