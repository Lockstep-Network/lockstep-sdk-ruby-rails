class Schema::InviteData < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The email address of the invited user.
  # @type: string
  field :email

  # The status of the user.
  # @type: string
  field :user_status



end