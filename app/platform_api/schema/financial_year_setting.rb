class Schema::FinancialYearSetting < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Lockstep when this record is
  # added to the Lockstep platform.
  # @type: string
  # @format: uuid
  field :financial_year_setting_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The AppEnrollmentId of the application that imported this record.  For accounts
  # with more than one financial system connected, this field identifies the originating
  # financial system that produced this record.  This value is null if this record
  # was not loaded from an external ERP or financial system.
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # The type of financial year, either Calendar or Fiscal.
  # @type: string
  field :year_type

  # Total number of periods in the year. For Calendar year types this should always be 12. For Fiscal year types
  # this can either be 12 or 13 for a 4 week 13 period year.
  # @type: integer
  # @format: int32
  field :total_periods

  # The start date of the financial year. Should be entered in MM-DD format.
  # @type: string
  # @format: date
  field :start_date

  # The end date of the financial year. Should be entered in MM-DD format.
  # @type: string
  # @format: date
  field :end_date

  # The date on which this financial year setting record was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID number of the user who created this financial year setting.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date on which this financial year setting record was last modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID number of the user who most recently modified this financial year setting.
  # @type: string
  # @format: uuid
  field :modified_user_id

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}


end