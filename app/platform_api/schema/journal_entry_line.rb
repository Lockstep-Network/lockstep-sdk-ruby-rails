class Schema::JournalEntryLine < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Lockstep when this record is
  # added to the Lockstep platform.
  #             
  # For the ID of this record in its originating financial system, see `ErpKey`.
  # @type: string
  # @format: uuid
  field :journal_entry_line_id

  # The Journal Entry with which this line is associated.
  # @type: string
  # @format: uuid
  field :journal_entry_id

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

  # The unique ID of this record as it was known in its originating financial system.
  #             
  # If this journal entry record was imported from a financial system, it will have the value `ErpKey`
  # set to the original primary key number of the record as it was known in the originating financial
  # system.  If this record was not imported, this value will be `null`.
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # The Financial Account with which this line is associated.
  # @type: string
  # @format: uuid
  field :financial_account_id

  # The unique code/identifier assigned to each account in the chart of accounts.
  # @type: string
  field :account_number

  # The name of the account.
  # @type: string
  field :account_name

  # Debit to account.
  # @type: number
  # @format: double
  field :debit

  # Credit to account.
  # @type: number
  # @format: double
  field :credit

  # The transaction currency in which the entry is recorded, especially useful for multi-currency environments.
  # @type: string
  field :currency

  # The base currency debit amount for the account.
  # @type: number
  # @format: double
  field :base_debit

  # The base currency credit amount for the account.
  # @type: number
  # @format: double
  field :base_credit

  # The base currency in which the entry is recorded, especially useful for multi-currency environments.
  # @type: string
  field :base_currency

  # The ERP’s identifier for the user who recorded the journal entry line.
  # @type: string
  field :source_created_user

  # A memo related to this line.
  # @type: string
  field :memo

  # The date that the journal entry line was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID of the user who created the journal entry line.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date that the journal entry line was last modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID of the user who last modified the journal entry line.
  # @type: string
  # @format: uuid
  field :modified_user_id

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}


end