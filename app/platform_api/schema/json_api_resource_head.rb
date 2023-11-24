class Schema::JsonApiResourceHead < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Unique Id of this resource in system.
  # @type: string
  field :id

  # A known resource type.
  # @type: string
  field :type



end