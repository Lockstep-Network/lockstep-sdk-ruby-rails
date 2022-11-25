class Schema::FeatureFlag < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Name of the feature flags
  # @type: array
  field :names

end