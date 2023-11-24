class Schema::InboundPaymentSync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # CUD operation type
  # @type: string
  field :operation_type

  # Contains details to create an payment in the ERP
  # @type: string
  # @format: uuid
  field :network_id

  # The CompanyId of the connected Payment
  # @type: string
  # @format: uuid
  field :company_network_id

  # The CompanyErpKey of the connected Payment
  # @type: string
  field :company_erp_key

  # The PaymentType of the connected Payment
  # @type: string
  field :payment_type

  # Payment amount of the connected Payment
  # @type: number
  # @format: double
  field :payment_amount

  # The CurrencyCode of the connected Payment
  # @type: string
  field :currency_code

  # The CurrencyRate of the connected Payment
  # @type: number
  # @format: double
  field :currency_rate

  # The BankAccountId of the connected Payment
  # @type: string
  field :bank_account_id

  # The PostDate of the connected Payment
  # @type: string
  # @format: date-time
  field :payment_date, Types::Params::DateTime

  # The PostDate of the connected Payment
  # @type: string
  # @format: date-time
  field :post_date, Types::Params::DateTime

  # The ErpKey of the connected Payment
  # @type: string
  field :erp_key

  # The TenderType of the connected Payment
  # @type: string
  field :tender_type

  # The MemoText of the connected Payment
  # @type: string
  field :memo_text

  # The UnappliedAmount of the connected Payment
  # @type: number
  # @format: double
  field :unapplied_amount

  # The BaseCurrencyPaymentAmount of the connected Payment
  # @type: number
  # @format: double
  field :base_currency_payment_amount

  # The BaseCurrencyUnappliedAmount of the connected Payment
  # @type: number
  # @format: double
  field :base_currency_unapplied_amount

  # Nested object of company object
  field :company

  # Sync time
  # @type: string
  # @format: date-time
  field :timestamp, Types::Params::DateTime

  # Last sync time
  # @type: string
  # @format: date-time
  field :last_attempted, Types::Params::DateTime

  # Sync status
  # @type: string
  field :status

  # Sync status message
  # @type: string
  field :message


  has_many :applications, {:class_name=>"Schema::InboundPaymentApplication", :included=>true}

end