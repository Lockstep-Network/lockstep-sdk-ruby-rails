class Schema::PaymentDetail < Lockstep::ApiRecord

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

  # The unique ID of this Payment.
  # @type: string
  # @format: uuid
  field :payment_id

  # The ID of the customer to which this Payment belongs.
  # @type: string
  # @format: uuid
  field :customer_id

  # The name of the customer to which this Payment belongs.
  # @type: string
  field :customer_name

  # Memo or reference text (ex. memo field on a check).
  # @type: string
  field :memo_text

  # Reference code for the payment for the given Erp system.
  # @type: string
  field :reference_code

  # The name of the Primary Contact for the Customer.
  # @type: string
  field :primary_contact

  # The Email address of the Customer.
  # @type: string
  field :email

  # Total amount of this Payment.
  # @type: number
  # @format: double
  field :payment_amount

  # Unapplied balance of this Payment.
  # @type: number
  # @format: double
  field :unapplied_amount

  # The type of payment, Payment or AP Payment.
  # @type: string
  field :payment_type

  # The date of this Payment.
  # @type: string
  # @format: date
  field :payment_date

  # Payment post date.
  # @type: string
  # @format: date
  field :post_date

  # The phone number of the Customer's Primary Contact.
  # @type: string
  field :phone

  # The fax number of the Customer's Primary Contact.
  # @type: string
  field :fax

  # The first line of the address for the Customer's Primary Contact.
  # @type: string
  field :address1

  # The second line of the address for the Customer's Primary Contact.
  # @type: string
  field :address2

  # The third line of the address for the Customer's Primary Contact.
  # @type: string
  field :address3

  # The city of the address for the Customer's Primary Contact.
  # @type: string
  field :city

  # The state/region of the address for the Customer's Primary Contact.
  # @type: string
  field :state_region

  # The postal/zip code of the address for the Customer's Primary Contact.
  # @type: string
  field :postal_code

  # The 2 character country code of the address for the Customer's Primary Contact.
  # @type: string
  field :country_code

  belongs_to :customer, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}
  belongs_to :connection, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}


end