class Schema::JournalEntryLineSync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Indicates what action to take when an existing object has been found during the sync process.
  field :on_match_action

  # This is the primary key of the Journal Entry Line record. For this field, you should use whatever the Journal Entry Line's unique
  # identifying number is in the originating system. Search for a unique, non-changing number within the
  # originating financial system for this record.
  #             
  # Example: If you store your Journal Entry Line records in a database, whatever the primary key for the Journal Entry Line table is
  # in the database should be the "ErpKey".
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # The original primary key or unique ID of the journal entry to which this line belongs.  This value should
  # match the Journal Entry ErpKey field on the JournalEntrySyncModel.
  # @type: string
  field :journal_entry_erp_key

  # An optional Financial Account with which this line is associated. This value should
  # match the Financial Account ErpKey field on the FinancialAccountSyncModel.
  # @type: string
  field :financial_account_erp_key

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
  field :currency_code

  # The CurrencyRate of the connected Payment
  # @type: number
  # @format: double
  field :currency_rate

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
  field :base_currency_code

  # The ERP’s identifier for the user who recorded the journal entry line.
  # @type: string
  field :source_created_user

  # A memo related to this line.
  # @type: string
  field :memo

  # A JSON string representing the dimensions for this journal entry line.
  # @type: object
  field :dimensions

  # The source object ERP key for this journal entry line.
  # @type: string
  field :source_object_erp_key

  # The ID of the SourceObjectType for this journal entry line.
  field :source_object_type

  # If known, the date when this record was created according to the originating financial system
  # in which this record is maintained.  If the originating financial system does not maintain a
  # created-date, leave this field null.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # If known, the date when this record was most recently modified according to the originating
  # financial system in which this record is maintained.  If the originating financial system does
  # not maintain a most-recently-modified-date, leave this field null.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime



end