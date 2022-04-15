class Schema::Provisioning < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The full name of the new user
  # @type: string
  field :full_name

  # The time zone of the new user
  # @type: string
  field :time_zone

  # The default currency of the new user
  # @type: string
  field :default_currency

  # The information necessary to enroll the user in their ERP
  field :erp

  # The company information for the new user and group
  field :company



end