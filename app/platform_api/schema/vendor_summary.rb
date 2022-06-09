class Schema::VendorSummary < Lockstep::ApiRecord

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

  # The unique ID of this company.
  # @type: string
  # @format: uuid
  field :vendor_id

  # The name of the company.
  # @type: string
  field :vendor_name

  # The app enrollment ID this Vendor is associated with
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # The name of this Vendor's primary contact
  # @type: string
  field :primary_contact_name

  # This Vendor's primary contact id
  # @type: string
  # @format: uuid
  field :primary_contact_id

  # The amount paid to this Vendor in the last 30 days
  # @type: double
  field :amount_paid_last30

  # The outstanding advance pay balance with this Vendor
  # @type: number
  # @format: double
  field :advance_pay_outstanding

  # The amount billed from this Vendor in the last 30 days
  # @type: number
  # @format: double
  field :amount_billed_last30

  # The outstanding balance with this Vendor
  # @type: number
  # @format: double
  field :amount_billed_outstanding

  # The number of open bills with this Vendor
  # @type: integer
  # @format: int32
  field :open_bill_count

  # The number of bills paid to this Vendor in the last 30 days
  # @type: integer
  # @format: int32
  field :paid_bill_count

  # The total count of open bills and those paid in the last 30 days
  # @type: integer
  # @format: int32
  field :total_bill_count


  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}


end