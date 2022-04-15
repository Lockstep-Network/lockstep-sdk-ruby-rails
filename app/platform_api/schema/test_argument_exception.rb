class Schema::TestArgumentException < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  
  field :target_site

  
  # @type: string
  field :stack_trace

  
  # @type: string
  field :message

  
  # @type: object
  field :data

  
  field :inner_exception

  
  # @type: string
  field :help_link

  
  # @type: string
  field :source

  
  # @type: integer
  # @format: int32
  field :h_result



end