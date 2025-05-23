class Schema::InvoiceAddress < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by ADS when this record is
  # added to the Accounting Data Service.
  # @type: string
  # @format: uuid
  field :invoice_address_id

  # The GroupKey uniquely identifies a single Accounting Data Service account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The ID number of the invoice this address belongs to
  # @type: string
  # @format: uuid
  field :invoice_id

  # The first line of the address.
  # @type: string
  field :line1

  # The second line of the address.
  # @type: string
  field :line2

  # The third line of the address.
  # @type: string
  field :line3

  # The name of the city for this address.
  # @type: string
  field :city

  # The state or region part of this address.
  # @type: string
  field :region

  # The postal code for this address.
  # @type: string
  field :postal_code

  # The country for this address.
  # @type: string
  field :country

  # The latitude of this address, if available.
  # @type: number
  # @format: float
  field :latitude

  # The longitude of this address, if available.
  # @type: number
  # @format: float
  field :longitude

  # The date on which this address record was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID number of the user who created this address.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date on which this address record was last modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID number of the user who most recently modified this address.
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

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}


end