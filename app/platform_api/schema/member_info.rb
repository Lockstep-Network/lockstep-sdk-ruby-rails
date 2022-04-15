class Schema::MemberInfo < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  
  field :member_type

  
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


  has_many :custom_attributes, {:class_name=>"Schema::CustomAttributeData", :included=>true}

end