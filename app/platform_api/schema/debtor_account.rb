class Schema::DebtorAccount < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique identifier of an existing customer. Will be used to match to a reusable payment
  # method if one exists. If specified, the other properties on this object will be ignored.
  # Trying to create a payment with an unknown customer will result in a 400 status code response.
  # @type: string
  field :customer_id

  # The merchant's unique identifier of the debtor who will receive the payment request.
  # @type: string
  field :account_id

  # The name of the debtor who will receive the payment request.
  # @type: string
  field :name

  # The email address of the debtor who will receive the payment request.
  # @type: string
  field :email_address

  # Debtor Agent Account object.
  field :debtor_agent_account

  belongs_to :customer, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}
  belongs_to :connection, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}


end