class Schema::State < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Name of the state
  # @type: string
  field :name

  # 2 letter alphabetic code for the given state
  # @type: string
  field :alpha2

  # A different name for a state
  # @type: string
  field :aliases



end