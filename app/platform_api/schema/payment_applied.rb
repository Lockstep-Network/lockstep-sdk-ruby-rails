class Schema::PaymentApplied < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The unique ID of this record, automatically assigned by Lockstep when this record is
  # added to the Lockstep platform.
  #             
  # For the ID of this record in its originating financial system, see `ErpKey`.
  # @type: string
  # @format: uuid
  field :payment_applied_id

  # The Invoice this payment is applied to.
  # @type: string
  # @format: uuid
  field :invoice_id

  # The Payment applied to the invoice.
  # @type: string
  # @format: uuid
  field :payment_id

  # The unique ID of this record as it was known in its originating financial system.
  #             
  # If this company record was imported from a financial system, it will have the value `ErpKey`
  # set to the original primary key number of the record as it was known in the originating financial
  # system.  If this record was not imported, this value will be `null`.
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # The entry number of this payment application.  This is often a journal entry number, confirmation code,
  # or other identifying field for this payment application.
  # @type: integer
  # @format: int32
  field :entry_number

  # The date this payment was applied to this invoice.
  # @type: string
  # @format: date-time
  field :apply_to_invoice_date, Types::Params::DateTime

  # The total amount that was applied to this Invoice from the Payment.
  # @type: number
  # @format: double
  field :payment_applied_amount

  # Date payment applied record was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The id of the user who created this applied payment.
  # @type: string
  # @format: uuid
  field :created_user_id

  # Date payment applied record was modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The id of the user who modified this applied payment.
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

  # The invoice associated with this applied payment.
  field :invoice

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}


end