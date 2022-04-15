class Schema::ProvisioningFinalizeRequest < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The full name of the user
  # @type: string
  field :full_name

  # The time zone of the user
  # @type: string
  field :time_zone

  # The default currency of the user
  # @type: string
  field :default_currency

  # The company information for the user and group
  field :company

  # Optional connector information needed to enroll user to their email connector
  field :email_connector



end