class Schema::PayablesComingDueHeader < Lockstep::ApiRecord

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

  # Number of bills due for this time period
  # @type: integer
  # @format: int32
  field :number_of_bills_due

  # Number of total vendors for this time period
  # @type: integer
  # @format: int32
  field :number_of_vendors

  # Percentage of total for this time period
  # @type: number
  # @format: double
  field :percentage_of_total

  # The group's base currency code.
  # @type: string
  field :base_currency_code

  # Total amount due for this time period in the group's base currency.
  # @type: number
  # @format: double
  field :total_amount_due

  # This model represents all the payables that are
  # either already due or due within this date.
  # @type: string
  # @format: date-time
  field :due_date, Types::Params::DateTime



end