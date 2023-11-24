class Schema::Source < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Source of error's Pointer
  # @type: string
  field :pointer



end