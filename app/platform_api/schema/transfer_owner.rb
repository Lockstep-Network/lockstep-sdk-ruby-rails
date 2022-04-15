class Schema::TransferOwner < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The previous owner of the account.
  field :previous_owner

  # The new owner of the account.
  field :new_owner



end