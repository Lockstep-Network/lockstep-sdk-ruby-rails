class Schema::SfCustomerResponse < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique identifier of the customer.
  # @type: string
  field :customer_id

  # The identifier of the company that this customer is a customer of.
  # @type: string
  field :company_id

  # The external identifier of this customer.
  # @type: string
  field :external_id

  # Enum: "ACTIVE" "DELETED" "NOT_ASSIGNED" "DELETED_MANUAL_MERGE"
  # The status of the customer.
  # @type: string
  field :status

  # Status if the customer is automatched with provider.
  # @type: boolean
  field :auto_matched

  # Country (based on 3-char ISO/DI-3166 country code)
  # @type: string
  field :primary_country

  # Currency of the customer account as an ISO 4217 currency code.
  # @type: string
  field :currency

  # The first name of the customer.
  # @type: string
  field :first_name

  # The last name of the customer.
  # @type: string
  field :last_name

  # The name of the company if this customer is a company.
  # @type: string
  field :company_name

  # The email address of the customer.
  # @type: string
  field :email_address

  # The telephone number of the customer.
  # @type: string
  field :contact_tel_no

  # The tax number for the customer. This may be a VAT number for a company,
  # or some other form of ID number for an individual.
  # @type: string
  field :tax_number

  # Date the customer record was created. ISO 8601 date format.
  # @type: string
  # @format: date-time
  field :created_date_time, Types::Params::DateTime

  # Date the customer was last updated. ISO 8601 date format.
  # Customers may be updated by WPB or external servicers.
  # @type: string
  # @format: date-time
  field :updated_date_time, Types::Params::DateTime

  # Address of a Company, Provider or Customer. All fields are optional;
  # without address line 1, city or country some operations may not be supported.
  field :address

  belongs_to :customer, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}
  belongs_to :connection, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}
  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}

  has_many :payment_instruments, {:class_name=>"Schema::PaymentInstrument", :included=>true}

end