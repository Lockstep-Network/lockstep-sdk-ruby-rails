class Schema::JournalEntrySync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Indicates what action to take when an existing object has been found during the sync process.
  field :on_match_action

  # This is the primary key of the Journal Entry record. For this field, you should use whatever the Journal Entry's unique
  # identifying number is in the originating system. Search for a unique, non-changing number within the
  # originating financial system for this record.
  #             
  # Example: If you store your Journal Entry records in a database, whatever the primary key for the Journal Entry table is
  # in the database should be the "ErpKey".
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # The ERP’s identifier for this journal entry, usually has meaning to the user.
  # May be the same value of the ERP Key.
  # @type: string
  field :journal_id

  # Possible sources for a Journal Entry.
  field :source

  # Possible statuses for a Journal Entry.
  field :status

  # A brief description explaining the purpose of the journal entry.
  # @type: string
  field :description

  # An additional comment related to the entry.
  # @type: string
  field :comment

  # Any reference number or identifier associated with the entry, such as an invoice number or purchase order.
  # @type: string
  field :reference_number

  # The raw posting date from the source.
  # @type: string
  # @format: date-time
  field :source_posting_date, Types::Params::DateTime

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