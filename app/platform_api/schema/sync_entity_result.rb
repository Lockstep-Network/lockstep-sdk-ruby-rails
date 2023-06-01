class Schema::SyncEntityResult < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The number of entities inserted
  # @type: integer
  # @format: int32
  field :insert_count

  # The number of entities updated
  # @type: integer
  # @format: int32
  field :update_count

  # The number of entities deleted
  # @type: integer
  # @format: int32
  field :delete_count

  # The number of entities skipped
  # @type: integer
  # @format: int32
  field :skip_count

  # The number of errors encountered during sync
  # @type: integer
  # @format: int32
  field :error_count

  # The errors encountered during sync keyed by ERP key
  # @type: object
  field :errors

  # The records that were skipped during sync keyed by ERP key
  # @type: object
  field :skips



end