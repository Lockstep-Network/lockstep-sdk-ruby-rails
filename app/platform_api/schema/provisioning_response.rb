class Schema::ProvisioningResponse < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # If provisioning is successful, contains the username of the created user.
  # @type: string
  field :user_name

  # If provisioning is successful, contains subscription account name of created user.
  # @type: string
  field :account_name

  # If provisioning is successful, contains the unique identifier of the created user.
  # @type: string
  # @format: uuid
  field :user_id

  # If provisioning is successful, contains the group key of the created user.
  # @type: string
  # @format: uuid
  field :group_key

  # If provisioning is successful, contains the app enrollment id of the created app enrollment.
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # if provisioning is successful, contains the sync request id of the sync that was started for the app enrollment.
  # @type: string
  # @format: uuid
  field :sync_request_id

  # The error message(s).
  # @type: string
  field :error_message



end