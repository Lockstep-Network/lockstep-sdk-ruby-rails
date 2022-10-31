class Schema::DpoSummaryGroupTotal < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The total number of vendors with outstanding bills
  # @type: integer
  # @format: int32
  field :vendors

  # The total number of bills outstanding
  # @type: integer
  # @format: int32
  field :bills

  # The total amount outstanding
  # @type: number
  # @format: double
  field :amount_outstanding

  # The total dpo for the group key
  # @type: number
  # @format: double
  field :dpo



end