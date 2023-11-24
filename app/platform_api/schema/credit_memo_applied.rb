class Schema::CreditMemoApplied < Lockstep::ApiRecord

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
  field :credit_memo_applied_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The Lockstep ID of the Invoice to which this credit memo was applied.  This Invoice's outstanding balance
  # was reduced by the value of the field `CreditMemoAppliedAmount` on the date `ApplyToInvoiceDate`.
  #             
  # Example: Company ABC received a credit memo, CM000123 for $500.  Company ABC then chooses to apply this
  # credit memo to reduce the balance of the invoice PO1000578.  The `InvoiceErpKey` is the Lockstep Platform
  # ID number of Invoice `PO1000578`.
  # @type: string
  # @format: uuid
  field :invoice_id

  # The Lockstep ID of the Invoice of type "Credit Memo" that was consumed in this payment application event.
  #             
  # Example: Company ABC received a credit memo, CM000123 for $500.  Company ABC then chooses to apply this
  # credit memo to reduce the balance of the invoice PO1000578.  The `CreditMemoInvoiceId` is the Lockstep
  # Platform ID number of Invoice `CM000123`.
  # @type: string
  # @format: uuid
  field :credit_memo_invoice_id

  # The unique ID of this record as it was known in its originating financial system.
  #             
  # If this company record was imported from a financial system, it will have the value `ErpKey`
  # set to the original primary key number of the record as it was known in the originating financial
  # system.  If this record was not imported, this value will be `null`.
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # Possible statuses for a record that supports ERP Update.
  field :erp_update_status

  # Possible actions for a record that supports ERP Update.
  field :erp_update_action

  # Reference number for the applied credit memo.
  # @type: integer
  # @format: int32
  field :entry_number

  # The date on which this credit memo was applied to the Invoice represented by `InvoiceId`.
  # @type: string
  # @format: date-time
  field :apply_to_invoice_date, Types::Params::DateTime

  # The amount of the credit memo that was applied to the Invoice represented by `InvoiceId`.
  # @type: number
  # @format: double
  field :credit_memo_applied_amount

  # Date credit memo applied record was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The id of the user who created this applied credit memo.
  # @type: string
  # @format: uuid
  field :created_user_id

  # Date credit memo applied record was modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The id of the user who modified this applied credit memo.
  # @type: string
  # @format: uuid
  field :modified_user_id

  # The AppEnrollmentId of the application that imported this record.  For accounts
  # with more than one financial system connected, this field identifies the originating
  # financial system that produced this record.  This value is null if this record
  # was not loaded from an external ERP or financial system.
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # The date on which this record was last modified in source ERP.
  # @type: string
  # @format: date-time
  field :source_modified_date, Types::Params::DateTime

  # Additional attributes that may be required by the source system.
  # @type: object
  field :erp_system_attributes

  # The credit memo invoice associated with this applied credit memo
  field :credit_memo_invoice

  # The invoice associated with this applied credit memo
  field :invoice

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}

  has_many :attachments, {:class_name=>"Schema::Attachment", :included=>true}
  has_many :notes, {:class_name=>"Lockstep::Note", :included=>true, :foreign_key=>:object_key, :polymorphic=>{:table_key=>"CreditMemoApplied"}}
  has_many :custom_field_definitions, {:class_name=>"Schema::CustomFieldDefinition", :included=>true}
  has_many :custom_field_values, {:class_name=>"Schema::CustomFieldValue", :included=>true}

end