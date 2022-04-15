class Schema::CustomerDetailsPayment < Lockstep::ApiRecord

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

  # Unique identifier for payment
  # @type: string
  # @format: uuid
  field :payment_id

  # Unique identifier for payment applied
  # @type: string
  # @format: uuid
  field :payment_applied_id

  # Payment type
  # @type: string
  field :payment_type

  # Unique identifier for invoice payment is associated with
  # @type: string
  # @format: uuid
  field :invoice_id

  # Invoice type payment is associated with
  # @type: string
  field :invoice_type_code

  # Invoice reference code payment is associated with
  # @type: string
  field :invoice_reference_code

  # Invoice total amount payment is associated with
  # @type: number
  # @format: double
  field :invoice_total_amount

  # Date payment placed
  # @type: string
  # @format: date-time
  field :payment_date, Types::Params::DateTime

  # Amount payment was made for
  # @type: number
  # @format: double
  field :payment_amount



end