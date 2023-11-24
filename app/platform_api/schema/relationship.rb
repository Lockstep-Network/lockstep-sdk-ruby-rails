class Schema::Relationship < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # All created entities
  field :created

  # All updated entities
  field :updated

  # All deleted entities
  field :deleted



end