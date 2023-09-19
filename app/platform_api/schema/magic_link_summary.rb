class Schema::MagicLinkSummary < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Group that the summary is for
  # @type: string
  # @format: uuid
  field :group_key

  # Total number of magic links sent
  # @type: integer
  # @format: int32
  field :total_count

  # Total number of magic links that failed to send
  # @type: integer
  # @format: int32
  field :total_bounced

  # Total number of visits across all magic links
  # @type: integer
  # @format: int32
  field :total_visited



end