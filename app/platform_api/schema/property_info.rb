class Schema::PropertyInfo < Lockstep::ApiRecord

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

  
  field :property_type

  
  field :attributes

  
  # @type: boolean
  field :is_special_name

  
  # @type: boolean
  field :can_read

  
  # @type: boolean
  field :can_write

  
  field :get_method

  
  field :set_method


  has_many :custom_attributes, {:class_name=>"Schema::CustomAttributeData", :included=>true}

end