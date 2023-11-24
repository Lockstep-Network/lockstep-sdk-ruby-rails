class Schema::InboundSyncReportSummary < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Total Created entities
  # @type: integer
  # @format: int32
  field :total_created

  # Total Updated entities
  # @type: integer
  # @format: int32
  field :total_update

  # Total Deleted entities
  # @type: integer
  # @format: int32
  field :total_deleted



end