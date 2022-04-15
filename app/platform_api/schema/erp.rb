class Schema::Erp < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Unique ID for this ERP
  # @type: string
  # @format: uuid
  field :erp_system_id

  # Name of ERP
  # @type: string
  field :name

  # Flag to indicate if ERP is supported
  # @type: boolean
  field :is_supported



end