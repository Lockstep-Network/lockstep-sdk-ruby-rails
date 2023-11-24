class Schema::Error < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Status of  error
  # @type: integer
  # @format: int32
  field :status

  # Source of Error
  field :source

  # Error Detail
  # @type: string
  field :detail

  # Errors Title
  # @type: string
  field :title

  # Errors code
  # @type: string
  field :code

  # Contains meta about entity
  field :entity_meta



end