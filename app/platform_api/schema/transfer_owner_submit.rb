class Schema::TransferOwnerSubmit < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The ID of the user to transfer ownership to.
  # @type: string
  # @format: uuid
  field :target_user_id



end