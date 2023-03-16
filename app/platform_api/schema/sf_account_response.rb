class Schema::SfAccountResponse < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique identifier for account.
  # @type: string
  field :account_id

  # The unique identifier for company.
  # @type: string
  field :company_id

  # The unique identifier for servicer.
  # @type: string
  field :servicer_id

  # Servicer name for the given connected account.
  # @type: string
  field :servicer_name

  # User name of the account (typically an email address).
  # @type: string
  field :account_username

  # ISO 4217 currency code.
  # @type: string
  field :currency

  # Nickname of the account assigned by the account owner.
  # @type: string
  field :nickname

  # Enum: "PENDING" "ACTIVE" "CANCELLED" "AUTH_REQUIRED" "AWAITING_VERIFICATION"
  # @type: string
  field :status

  # Enum: "SYNC_IN_PROGRESS" "SYNC_COMPLETE"
  # If the account supports synchronisation, for example, it is a GoCardless account and supports importing mandates,
  # then this field may be set to one of the two below.
  # @type: string
  field :sync_status

  # Whether the connected account is enabled or not.
  # @type: boolean
  field :is_enabled

  # API key for the given connected account.
  # @type: string
  field :publishable_key

  # Items Enum: "card" "direct-debit"
  # An array of payment types supported by the provider in the company's country.
  # @type: array
  field :capabilities

  # Optional information that can be used to complete account activation at the servicer.
  field :authorisation

  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}


end