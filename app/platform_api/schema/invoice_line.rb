class Schema::InvoiceLine < Lockstep::ApiRecord

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
  field :invoice_line_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The ID number of the invoice this line belongs to.
  # @type: string
  # @format: uuid
  field :invoice_id

  # The unique ID of this record as it was known in its originating financial system, if it was
  # different from the original `LineNumber`.
  #             
  # If this company record was imported from a financial system, it will have the value `ErpKey`
  # set to the original primary key number of the record as it was known in the originating financial
  # system.  If this record was not imported, this value will be `null`.
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # The line number of this line, as defined in the originating ERP or accounting system.  You can sort on this number to
  # get the original view of lines within the invoice.
  # @type: string
  field :line_number

  # The account number this line is associated with in the originating ERP or accounting system.
  # @type: string
  field :account_number

  # A code number identifying the product or service that is specified on this line.
  # @type: string
  field :product_code

  # Description of this invoice line.
  # @type: string
  field :description

  # For lines measured in a unit other than "quantity", this code indicates the measurement system for the quantity field.
  # If the line is measured in quantity, this field is null.
  # @type: string
  field :unit_measure_code

  # The price of a single unit for this line.
  # @type: number
  # @format: double
  field :unit_price

  # The quantity of items for ths line.
  # @type: number
  # @format: double
  field :quantity

  # The number of items that have been shipped.
  # @type: number
  # @format: double
  field :quantity_shipped

  # The number of items that has been received.
  # @type: number
  # @format: double
  field :quantity_received

  # The total amount for this line.
  # @type: number
  # @format: double
  field :total_amount

  # If this line is tax exempt, this code indicates the reason for the exemption.
  # @type: string
  field :exemption_code

  # If null, the products specified on this line were delivered on the same date as all other lines.
  # If not null, this line was delivered or finalized on a different date than the overall invoice.
  # @type: string
  # @format: date
  field :reporting_date

  # An optional ID number for the line's origin address.
  # @type: string
  # @format: uuid
  field :override_origin_address_id

  # An optional ID number for the line's bill to address.
  # @type: string
  # @format: uuid
  field :override_bill_to_address_id

  # An optional ID number for the line's ship to address.
  # @type: string
  # @format: uuid
  field :override_ship_to_address_id

  # The date on which this line was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID number of the user who created this line.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date on which this line was last modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID number of the user who most recently modified this line.
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

  # Possible statuses for a record that supports ERP Update.
  field :erp_update_status

  # Possible actions for a record that supports ERP Update.
  field :erp_update_action

  # The date on which this record was last modified in source ERP.
  # @type: string
  # @format: date-time
  field :source_modified_date, Types::Params::DateTime

  # Additional attributes that may be required by the source system.
  # @type: object
  field :erp_system_attributes

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}

  has_many :notes, {:class_name=>"Lockstep::Note", :included=>true, :foreign_key=>:object_key, :polymorphic=>{:table_key=>"InvoiceLine"}}
  has_many :attachments, {:class_name=>"Schema::Attachment", :included=>true}

end