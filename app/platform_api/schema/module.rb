class Schema::Module < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  
  field :assembly

  
  # @type: string
  field :fully_qualified_name

  
  # @type: string
  field :name

  
  # @type: integer
  # @format: int32
  field :md_stream_version

  
  # @type: string
  # @format: uuid
  field :module_version_id

  
  # @type: string
  field :scope_name

  
  field :module_handle

  
  # @type: integer
  # @format: int32
  field :metadata_token


  has_many :custom_attributes, {:class_name=>"Schema::CustomAttributeData", :included=>true}

end