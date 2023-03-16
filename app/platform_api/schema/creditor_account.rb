class Schema::CreditorAccount < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The name of the creditor account.
  # @type: string
  field :name

  # The unique identifier of the provider used to execute this payment submission.
  # @type: string
  field :servicer_id

  # The name of the payment servicing organisation (for example, Stripe and PayPal).
  # @type: string
  field :servicer_name

  # The unique identifier of the company.
  # @type: string
  field :company_id

  # The unique identifier of the creditor account in Payments Acceptance Service.
  # @type: string
  field :account_id

  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}


end