class Schema::PaymentDetailHeader < Lockstep::ApiRecord

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

  # The base currency code of the group.
  # @type: string
  field :base_currency_code

  # The total number of Customers.
  # @type: integer
  # @format: int32
  field :customer_count

  # The total amount collected in the group's base currency.
  # @type: number
  # @format: double
  field :amount_collected

  # The total unapplied amount in the group's base currency.
  # @type: number
  # @format: double
  field :unapplied_amount

  # The number of paid invoices.
  # @type: integer
  # @format: int32
  field :paid_invoice_count

  # The number of open invoices.
  # @type: integer
  # @format: int32
  field :open_invoice_count



end