class Schema::Type < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  
  # @type: string
  field :name

  
  # @type: boolean
  field :is_collectible

  
  # @type: integer
  # @format: int32
  field :metadata_token

  
  field :type_handle

  
  # @type: boolean
  field :is_interface

  
  field :member_type

  
  # @type: string
  field :namespace

  
  # @type: string
  field :assembly_qualified_name

  
  # @type: string
  field :full_name

  
  field :assembly

  
  field :module

  
  # @type: boolean
  field :is_nested

  
  field :declaring_type

  
  field :declaring_method

  
  field :reflected_type

  
  field :underlying_system_type

  
  # @type: boolean
  field :is_type_definition

  
  # @type: boolean
  field :is_array

  
  # @type: boolean
  field :is_by_ref

  
  # @type: boolean
  field :is_pointer

  
  # @type: boolean
  field :is_constructed_generic_type

  
  # @type: boolean
  field :is_generic_parameter

  
  # @type: boolean
  field :is_generic_type_parameter

  
  # @type: boolean
  field :is_generic_method_parameter

  
  # @type: boolean
  field :is_generic_type

  
  # @type: boolean
  field :is_generic_type_definition

  
  # @type: boolean
  field :is_sz_array

  
  # @type: boolean
  field :is_variable_bound_array

  
  # @type: boolean
  field :is_by_ref_like

  
  # @type: boolean
  field :has_element_type

  
  # @type: integer
  # @format: int32
  field :generic_parameter_position

  
  field :generic_parameter_attributes

  
  field :attributes

  
  # @type: boolean
  field :is_abstract

  
  # @type: boolean
  field :is_import

  
  # @type: boolean
  field :is_sealed

  
  # @type: boolean
  field :is_special_name

  
  # @type: boolean
  field :is_class

  
  # @type: boolean
  field :is_nested_assembly

  
  # @type: boolean
  field :is_nested_fam_and_assem

  
  # @type: boolean
  field :is_nested_family

  
  # @type: boolean
  field :is_nested_fam_or_assem

  
  # @type: boolean
  field :is_nested_private

  
  # @type: boolean
  field :is_nested_public

  
  # @type: boolean
  field :is_not_public

  
  # @type: boolean
  field :is_public

  
  # @type: boolean
  field :is_auto_layout

  
  # @type: boolean
  field :is_explicit_layout

  
  # @type: boolean
  field :is_layout_sequential

  
  # @type: boolean
  field :is_ansi_class

  
  # @type: boolean
  field :is_auto_class

  
  # @type: boolean
  field :is_unicode_class

  
  # @type: boolean
  field :is_com_object

  
  # @type: boolean
  field :is_contextful

  
  # @type: boolean
  field :is_enum

  
  # @type: boolean
  field :is_marshal_by_ref

  
  # @type: boolean
  field :is_primitive

  
  # @type: boolean
  field :is_value_type

  
  # @type: boolean
  field :is_signature_type

  
  # @type: boolean
  field :is_security_critical

  
  # @type: boolean
  field :is_security_safe_critical

  
  # @type: boolean
  field :is_security_transparent

  
  field :struct_layout_attribute

  
  field :type_initializer

  
  # @type: string
  # @format: uuid
  field :guid

  
  field :base_type

  
  # @type: boolean
  field :is_serializable

  
  # @type: boolean
  field :contains_generic_parameters

  
  # @type: boolean
  field :is_visible


  has_many :custom_attributes, {:class_name=>"Schema::CustomAttributeData", :included=>true}
  has_many :generic_type_arguments, {:class_name=>"Schema::Type", :included=>true}

end