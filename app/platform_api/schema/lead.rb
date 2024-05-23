class Schema::Lead < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by ADS when this record is
  # added to the ADS Platform.
  # @type: string
  # @format: uuid
  field :lead_id

  # Name of lead
  # @type: string
  field :name

  # Name of company of lead
  # @type: string
  field :company

  # Email of lead
  # @type: string
  # @format: email
  field :email

  # Requested ERP of lead
  # @type: string
  field :erp_system



end