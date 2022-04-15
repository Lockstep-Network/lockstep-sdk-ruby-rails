class Schema::ActivityXRef < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Lockstep when this is
  # added to the Lockstep platform.
  # @type: string
  # @format: uuid
  field :activity_x_ref_id

  # The ID of the activity to which this reference belongs.
  # @type: string
  # @format: uuid
  field :activity_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The name of the table the activity reference is associated with
  # @type: string
  field :table_key

  # The ID of the object the activity reference is associated with
  # @type: string
  field :object_key



end