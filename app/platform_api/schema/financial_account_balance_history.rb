class Schema::FinancialAccountBalanceHistory < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Lockstep when this record is
  # added to the Lockstep platform.
  # @type: string
  # @format: uuid
  field :financial_account_balance_history_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The id of the Financial Account that this balance history is for.
  # @type: string
  # @format: uuid
  field :financial_account_id

  # The AppEnrollmentId of the application that imported this record.  For accounts
  # with more than one financial system connected, this field identifies the originating
  # financial system that produced this record.  This value is null if this record
  # was not loaded from an external ERP or financial system.
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # The financial year that this period falls under
  # @type: integer
  # @format: int32
  field :financial_year

  # The period number (1-12 or 1-13) that this balance history is for
  # @type: integer
  # @format: int32
  field :period_number

  # The start date of this period.
  # @type: string
  # @format: date-time
  field :period_start_date, Types::Params::DateTime

  # The end date of this period.
  # @type: string
  # @format: date-time
  field :period_end_date, Types::Params::DateTime

  # The status of this period. The status should be Closed if the books for this period have been closed,
  # if not the status should be Open. The status can also be Deleted if there was a recalculation that needed
  # to occur, for example due to a change in financial year settings.
  # @type: string
  field :status

  # The current or end balance of this period.
  # @type: number
  # @format: double
  field :balance

  # The date on which this financial account balance history record was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID number of the user who created this financial account balance history.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date on which this financial account balance history record was modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID number of the user who most recently modified this financial account balance history.
  # @type: string
  # @format: uuid
  field :modified_user_id

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}


end