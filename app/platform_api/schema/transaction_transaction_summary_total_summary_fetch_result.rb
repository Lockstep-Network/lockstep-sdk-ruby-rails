class Schema::TransactionTransactionSummaryTotalSummaryFetchResult < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  
  # @type: integer
  # @format: int32
  field :total_count

  
  # @type: integer
  # @format: int32
  field :page_size

  
  # @type: integer
  # @format: int32
  field :page_number

  # Represents transaction summary information based on the query request within the group account.
  field :summary


  has_many :records, {:class_name=>"Schema::Transaction", :included=>true}
  has_many :aging_summary, {:class_name=>"Schema::SummaryAgingTotals", :included=>true}
  has_many :currency_summaries, {:class_name=>"Schema::TransactionCurrencySummary", :included=>true}

end