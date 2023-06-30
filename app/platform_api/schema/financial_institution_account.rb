class Schema::FinancialInstitutionAccount < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique identifier for the Financial Institution Account.
  # @type: string
  # @format: uuid
  field :financial_institution_account_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # An alternate account id for the Financial Institution Account.
  # @type: string
  field :bank_account_id

  # The External Id for the Financial Institution Account.
  # @type: string
  field :erp_key

  # The App Enrollment Id this Financial Institution is associated with.
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # The name of the Financial Institution Account.
  # @type: string
  field :name

  # The status of the Financial Institution Account. Possible values are active,
  # inactive, deleted or archived.
  # @type: string
  field :status

  # The description for the Financial Institution Account.
  # @type: string
  field :description

  # The classification for the Financial Institution Account. Possible values are Asset, Equity,
  # Expense, Liability or Income.
  # @type: string
  field :account_type

  # The date the Financial Institution Account was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The user that has created the Financial Institution Account.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date the Financial Institution Account was modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The user that has modified the Financial Institution Account.
  # @type: string
  # @format: uuid
  field :modified_user_id

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}


end

