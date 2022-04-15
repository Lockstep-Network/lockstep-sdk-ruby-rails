class Schema::Invite < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The invited email address
  # @type: string
  field :email

  # True if the invite was sent successfully
  # @type: boolean
  field :success

  # The invited user, may be null if the user could not be invited
  field :invited_user

  # The error message if the invite was not successful
  # @type: string
  field :error_message



end