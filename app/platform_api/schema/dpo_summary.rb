class Schema::DpoSummary < Lockstep::ApiRecord

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

  # The unique ID of the vendor.
  # @type: string
  # @format: uuid
  field :vendor_id

  # The name of the vendor.
  # @type: string
  field :vendor_name

  # The name of the primary contact.
  # @type: string
  field :primary_contact

  # The total number of outstanding bills.
  # @type: integer
  # @format: int32
  field :bills

  # The total amount outstanding.
  # @type: number
  # @format: double
  field :amount_outstanding

  # The days payable outstanding value.
  # @type: number
  # @format: double
  field :dpo



end