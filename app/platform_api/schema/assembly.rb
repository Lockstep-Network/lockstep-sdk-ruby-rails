class Schema::Assembly < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  
  # @type: string
  field :code_base

  
  field :entry_point

  
  # @type: string
  field :full_name

  
  # @type: string
  field :image_runtime_version

  
  # @type: boolean
  field :is_dynamic

  
  # @type: string
  field :location

  
  # @type: boolean
  field :reflection_only

  
  # @type: boolean
  field :is_collectible

  
  # @type: boolean
  field :is_fully_trusted

  
  # @type: string
  field :escaped_code_base

  
  field :manifest_module

  
  # @type: boolean
  field :global_assembly_cache

  
  # @type: integer
  # @format: int64
  field :host_context

  
  field :security_rule_set


  has_many :defined_types, {:class_name=>"Schema::TypeInfo", :included=>true}
  has_many :exported_types, {:class_name=>"Schema::Type", :included=>true}
  has_many :custom_attributes, {:class_name=>"Schema::CustomAttributeData", :included=>true}
  has_many :modules, {:class_name=>"Schema::Module", :included=>true}

end