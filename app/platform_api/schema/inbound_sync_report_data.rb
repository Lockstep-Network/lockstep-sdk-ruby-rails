class Schema::InboundSyncReportData < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Unique Id of this resource in system.
  # @type: string
  field :id

  # A known resource type.
  # @type: string
  field :type

  # Attributes of the resource to explain the object.
  field :attributes

  # Relationships of the resource.
  field :relationships


  has_many :errors, {:class_name=>"Schema::Error", :included=>true}

end