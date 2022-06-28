class Schema::PayableComingDueReport < Lockstep::ApiRecord

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

  # Number of bills due for this time period.
  # @type: integer
  # @format: int32
  field :numberOfBillsDue

  # The unique Lockstep Id for the Vendor.
  # @type: string
  # @format: uuid
  field :vendorId

  # Name for this company.
  # @type: string
  field :vendorName

  # Primary Contact for this company.
  # @type: string
  field :primaryContact

  # Percentage of total for this time period.
  # @type: number
  # @format: double
  field :percentageOfTotal

  # Total amount due for this time period.
  # @type: number
  # @format: double
  field :totalAmountDue

  # This model represents all the payables that are either already due or due within this date.
  # @type: string
  # @format: date-time
  field :dueDate, Types::Params::DateTime
end
