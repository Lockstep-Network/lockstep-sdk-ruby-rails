class Schema::CustomAttributeData < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  
  field :attribute_type

  
  field :constructor


  has_many :constructor_arguments, {:class_name=>"Schema::CustomAttributeTypedArgument", :included=>true}
  has_many :named_arguments, {:class_name=>"Schema::CustomAttributeNamedArgument", :included=>true}

end