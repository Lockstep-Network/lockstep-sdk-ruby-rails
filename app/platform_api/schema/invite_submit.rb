class Schema::InviteSubmit < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The email address of the user to invite
  # @type: string
  # @format: email
  field :email



end