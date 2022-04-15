class Schema::ProblemDetails < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  
  # @type: string
  field :type

  
  # @type: string
  field :title

  
  # @type: integer
  # @format: int32
  field :status

  
  # @type: string
  field :detail

  
  # @type: string
  field :instance



end