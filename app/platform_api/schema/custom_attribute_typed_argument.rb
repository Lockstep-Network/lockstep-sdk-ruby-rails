class Schema::CustomAttributeTypedArgument < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  
  field :argument_type

  
  field :value



end