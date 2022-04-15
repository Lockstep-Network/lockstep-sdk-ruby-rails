class Schema::ParameterInfo < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  
  field :attributes

  
  field :member

  
  # @type: string
  field :name

  
  field :parameter_type

  
  # @type: integer
  # @format: int32
  field :position

  
  # @type: boolean
  field :is_in

  
  # @type: boolean
  field :is_lcid

  
  # @type: boolean
  field :is_optional

  
  # @type: boolean
  field :is_out

  
  # @type: boolean
  field :is_retval

  
  field :default_value

  
  field :raw_default_value

  
  # @type: boolean
  field :has_default_value

  
  # @type: integer
  # @format: int32
  field :metadata_token


  has_many :custom_attributes, {:class_name=>"Schema::CustomAttributeData", :included=>true}

end