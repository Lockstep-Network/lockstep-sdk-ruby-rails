class Schema::EventInfo < Lockstep::ApiRecord

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

  
  # @type: boolean
  field :is_special_name

  
  field :add_method

  
  field :remove_method

  
  field :raise_method

  
  # @type: boolean
  field :is_multicast

  
  field :event_handler_type


  has_many :custom_attributes, {:class_name=>"Schema::CustomAttributeData", :included=>true}

end