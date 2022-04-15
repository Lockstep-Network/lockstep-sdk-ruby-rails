class Schema::FinancialAccount < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique identifier for the Financial Account.
  # @type: string
  # @format: uuid
  field :financial_account_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The code for the Financial Account. Can either be a general ledger or
  # an account code.
  # @type: string
  field :code

  # The External Id for the Financial Account.
  # @type: string
  field :erp_key

  # The App Enrollment Id for the Financial Account.
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # The name of the Financial Account.
  # @type: string
  field :name

  # The status of the Financial Account. Possible values are active,
  # inactive, deleted or archived.
  # @type: string
  field :status

  # The cashflow type for the Financial Account. Examples include cash, financing, investment
  # or operation.
  # @type: string
  field :cashflow_type

  # The description for the Financial Account.
  # @type: string
  field :description

  # The classification for the Financial Account. Possible values are Asset, Equity,
  # Expense, Liability or Revenue.
  # @type: string
  field :classification

  # The category for the Financial Account. Examples include Current Asset, Current Liability, Common Stock
  # @type: string
  field :category

  # The subcategory for the Financial Account. Examples include Cash, Property, Bank Loan, etc.
  # @type: string
  field :subcategory

  # The date the FinancialAccount was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The user that has created the Financial Account.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date the Financial Account was modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The user that has modified the Financial Account.
  # @type: string
  # @format: uuid
  field :modified_user_id

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}


end