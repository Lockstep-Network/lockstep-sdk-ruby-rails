class Schema::PaymentDetail < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The GroupKey uniquely identifies a single ADS Platform account.  All records for this
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

  # Possible statuses for a record that supports ERP write.
  field :erp_write_status

  # The name of the ErpWriteStatus for this payment
  # @type: string
  field :erp_write_status_name

  # The currency code of the payment.
  # @type: string
  field :currency_code

  # Total amount of this Payment.
  # @type: number
  # @format: double
  field :payment_amount

  # Unapplied balance of this Payment.
  # @type: number
  # @format: double
  field :unapplied_amount

  # The base currency code of the group.
  # @type: string
  field :base_currency_code

  # The payment amount in the group's base currency.
  # @type: number
  # @format: double
  field :base_currency_payment_amount

  # The payment amount in the group's base currency.
  # @type: number
  # @format: double
  field :base_currency_unapplied_amount

  # The type of payment, AR Payment or AP Payment.
  #             
  # Recognized PaymentType values are:
  # * `AR Payment` - A payment made by a Customer to the Company
  # * `AP Payment` - A payment made by the Company to a Vendor
  # @type: string
  field :payment_type

  # Cash, check, credit card, wire transfer.
  #             
  # Recognized TenderType values are:
  # * `Cash` - A cash payment or other direct transfer.
  # * `Check` - A check payment.
  # * `Credit Card` - A payment made via a credit card.
  # * `Wire Transfer` - A payment made via wire transfer from another financial institution.
  # * `Other` - A payment made via another method not listed above.
  # @type: string
  field :tender_type

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