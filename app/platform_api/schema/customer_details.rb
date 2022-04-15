class Schema::CustomerDetails < Lockstep::ApiRecord

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

  # The unique ID of this customer
  # @type: string
  # @format: uuid
  field :customer_id

  # The unique ID of this customer
  # @type: string
  field :name

  # Customer address info
  # @type: string
  field :address1

  # Customer address info
  # @type: string
  field :address2

  # Customer address info
  # @type: string
  field :address3

  # Customer address info
  # @type: string
  field :city

  # Customer address info
  # @type: string
  field :state

  # Customer address info
  # @type: string
  field :postal_code

  # Customer address country
  # @type: string
  field :country

  # Customer phone number
  # @type: string
  field :phone_number

  # Customer fax number
  # @type: string
  field :fax_number

  # Customer AR email address
  # @type: string
  field :email

  # Customer primary contact id
  # @type: string
  # @format: uuid
  field :contact_id

  # Customer primary contact name
  # @type: string
  field :contact_name

  # Customer primary contact email address
  # @type: string
  field :contact_email

  # Customer number of outstanding invoices
  # @type: integer
  # @format: int32
  field :outstanding_invoices

  # Customer total outstanding invoice amount
  # @type: number
  # @format: double
  field :outstanding_amount

  # Customer total past due amount
  # @type: number
  # @format: double
  field :amount_past_due

  belongs_to :customer, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}
  belongs_to :connection, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}

  has_many :payments, {:class_name=>"Schema::CustomerDetailsPayment", :included=>true}

end