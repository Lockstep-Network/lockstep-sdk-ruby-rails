class Schema::FieldInfo < Lockstep::ApiRecord

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

  
  field :member_type

  
  field :attributes

  
  field :field_type

  
  # @type: boolean
  field :is_init_only

  
  # @type: boolean
  field :is_literal

  
  # @type: boolean
  field :is_not_serialized

  
  # @type: boolean
  field :is_pinvoke_impl

  
  # @type: boolean
  field :is_special_name

  
  # @type: boolean
  field :is_static

  
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
  field :is_security_critical

  
  # @type: boolean
  field :is_security_safe_critical

  
  # @type: boolean
  field :is_security_transparent

  
  field :field_handle


  has_many :custom_attributes, {:class_name=>"Schema::CustomAttributeData", :included=>true}

end