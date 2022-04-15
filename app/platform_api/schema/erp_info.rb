class Schema::ErpInfo < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The id of the ERP's App
  # @type: string
  # @format: uuid
  field :app_id

  # The data required to store for connector access
  field :data



end