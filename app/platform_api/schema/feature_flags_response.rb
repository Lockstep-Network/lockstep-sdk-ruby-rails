class Schema::FeatureFlagsResponse < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # State of the requested Feature Flags
  # @type: object
  field :values



end