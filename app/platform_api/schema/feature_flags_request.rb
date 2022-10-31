class Schema::FeatureFlagsRequest < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The names of Feature Flags
  # @type: array
  field :names



end