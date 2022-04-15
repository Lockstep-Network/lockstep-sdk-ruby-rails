class Schema::MethodInfo < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  
  # @type: string
  field :name

  
  field :declaring_type

  
  field :reflected_type

  
  field :module

  
  # @type: boolean
  field :is_collectible

  
  # @type: integer
  # @format: int32
  field :metadata_token

  
  field :attributes

  
  field :method_implementation_flags

  
  field :calling_convention

  
  # @type: boolean
  field :is_abstract

  
  # @type: boolean
  field :is_constructor

  
  # @type: boolean
  field :is_final

  
  # @type: boolean
  field :is_hide_by_sig

  
  # @type: boolean
  field :is_special_name

  
  # @type: boolean
  field :is_static

  
  # @type: boolean
  field :is_virtual

  
  # @type: boolean
  field :is_assembly

  
  # @type: boolean
  field :is_family

  
  # @type: boolean
  field :is_family_and_assembly

  
  # @type: boolean
  field :is_family_or_assembly

  
  # @type: boolean
  field :is_private

  
  # @type: boolean
  field :is_public

  
  # @type: boolean
  field :is_constructed_generic_method

  
  # @type: boolean
  field :is_generic_method

  
  # @type: boolean
  field :is_generic_method_definition

  
  # @type: boolean
  field :contains_generic_parameters

  
  field :method_handle

  
  # @type: boolean
  field :is_security_critical

  
  # @type: boolean
  field :is_security_safe_critical

  
  # @type: boolean
  field :is_security_transparent

  
  field :member_type

  
  field :return_parameter

  
  field :return_type

  
  field :return_type_custom_attributes


  has_many :custom_attributes, {:class_name=>"Schema::CustomAttributeData", :included=>true}

end