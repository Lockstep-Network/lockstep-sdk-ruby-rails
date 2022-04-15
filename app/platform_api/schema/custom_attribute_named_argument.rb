class Schema::CustomAttributeNamedArgument < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  
  field :member_info

  
  field :typed_value

  
  # @type: string
  field :member_name

  
  # @type: boolean
  field :is_field



end