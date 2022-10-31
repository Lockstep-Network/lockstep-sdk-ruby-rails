class Schema::FinancialAccountBalanceHistorySync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The code for the Financial Account. Can either be a general ledger or
  # an account code.
  # @type: string
  field :financial_account_code

  # This is the primary key of the FinancialAccount record. For this field, you should use whatever the company's unique
  # identifying number is in the originating system. Search for a unique, non-changing number within the
  # originating financial system for this record.
  # Example: If you store your company records in a database, whatever the primary key for the company table is
  # in the database should be the ErpKey.
  # Example: If you use a financial system such as Quickbooks or Xero, look for the primary ID number of the
  # company record within that financial system.
  # @type: string
  field :financial_account_erp_key

  # The financial year that this period falls under
  # @type: integer
  # @format: int32
  field :financial_year

  # The period number (1-12 or 1-13) that this balance history is for
  # @type: integer
  # @format: int32
  field :period_number

  # The start date of this period.
  # @type: string
  # @format: date-time
  field :period_start_date, Types::Params::DateTime

  # The end date of this period.
  # @type: string
  # @format: date-time
  field :period_end_date, Types::Params::DateTime

  # The status of this period. The status should be Closed if the books for this period have been closed,
  # if not the status should be Open. The status can also be Deleted if there was a recalculation that needed
  # to occur, for example due to a change in financial year settings.
  # @type: string
  field :status

  # The current or end balance of this period.
  # @type: number
  # @format: double
  field :balance



end