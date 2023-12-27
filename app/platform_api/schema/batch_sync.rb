class Schema::BatchSync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The optional existing app enrollment to associate with the data in this batch.
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # True if this is a full sync, false if this is a partial sync. Defaults to false.
  # @type: boolean
  field :is_full_sync

  # The optional current batch number for this batch sync.
  # @type: integer
  # @format: int32
  field :current_batch

  # The optional total number of batchs for this batch sync.
  # @type: integer
  # @format: int32
  field :total_batches

  # The optional existing parent sync request id for the batch sync.
  # @type: string
  # @format: uuid
  field :parent_sync_request_id


  has_many :companies, {:class_name=>"Schema::CompanySync", :included=>true}
  has_many :contacts, {:class_name=>"Schema::ContactSync", :included=>true}
  has_many :credit_memo_applications, {:class_name=>"Schema::CreditMemoAppliedSync", :included=>true}
  has_many :invoices, {:class_name=>"Schema::InvoiceSync", :included=>true}
  has_many :invoice_lines, {:class_name=>"Schema::InvoiceLineSync", :included=>true}
  has_many :custom_fields, {:class_name=>"Schema::CustomFieldSync", :included=>true}
  has_many :payments, {:class_name=>"Schema::PaymentSync", :included=>true}
  has_many :payment_applications, {:class_name=>"Schema::PaymentAppliedSync", :included=>true}
  has_many :financial_year_settings, {:class_name=>"Schema::FinancialYearSettingSync", :included=>true}
  has_many :financial_accounts, {:class_name=>"Schema::FinancialAccountSync", :included=>true}
  has_many :financial_account_balance_histories, {:class_name=>"Schema::FinancialAccountBalanceHistorySync", :included=>true}
  has_many :base_currencies, {:class_name=>"Schema::BaseCurrencySync", :included=>true}
  has_many :journal_entries, {:class_name=>"Schema::JournalEntrySync", :included=>true}
  has_many :journal_entry_lines, {:class_name=>"Schema::JournalEntryLineSync", :included=>true}

end