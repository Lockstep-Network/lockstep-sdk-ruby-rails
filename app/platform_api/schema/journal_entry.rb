class Schema::JournalEntry < Lockstep::ApiRecord

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

  # The ERP’s identifier for this journal entry, usually has meaning to the user.
  # May be the same value of the ERP Key.
  # @type: string
  field :journal_id

  # Possible sources for a Journal Entry.
  field :source

  # The UTC date and time when this journal entry was posted.
  # @type: string
  # @format: date-time
  field :posting_date, Types::Params::DateTime

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

  # The date that the journal entry was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID of the user who created the journal entry.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date that the journal entry was last modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID of the user who last modified the journal entry.
  # @type: string
  # @format: uuid
  field :modified_user_id

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}

  has_many :lines, {:class_name=>"Schema::JournalEntryLine", :included=>true}
  has_many :attachments, {:class_name=>"Schema::Attachment", :included=>true}

end