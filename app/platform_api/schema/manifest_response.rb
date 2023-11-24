class Schema::ManifestResponse < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The status shows the response of return from requested data
  # @type: integer
  # @format: int32
  field :status

  # Message containing information about the sync request results.
  # @type: string
  field :message



end