class Schema::CompanyDetails < Lockstep::ApiRecord

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

  # The unique ID of this company
  # @type: string
  # @format: uuid
  field :customer_id

  # The unique ID of this company
  # @type: string
  field :name

  # Company address info
  # @type: string
  field :address1

  # Company address info
  # @type: string
  field :address2

  # Company address info
  # @type: string
  field :address3

  # Company address info
  # @type: string
  field :city

  # Company address info
  # @type: string
  field :state

  # Company address info
  # @type: string
  field :postal_code

  # Company address country
  # @type: string
  field :country

  # Company phone number
  # @type: string
  field :phone_number

  # Company fax number
  # @type: string
  field :fax_number

  # Company email address
  # @type: string
  field :email

  # Company primary contact id
  # @type: string
  # @format: uuid
  field :contact_id

  # Company primary contact name
  # @type: string
  field :contact_name

  # Company primary contact email address
  # @type: string
  field :contact_email

  # Company number of outstanding invoices
  # @type: integer
  # @format: int32
  field :outstanding_invoices

  # Company total outstanding invoice amount
  # @type: number
  # @format: double
  field :outstanding_amount

  # Company total past due amount
  # @type: number
  # @format: double
  field :amount_past_due

  belongs_to :customer, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}
  belongs_to :connection, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}

  has_many :payments, {:class_name=>"Schema::CompanyDetailsPayment", :included=>true}

end