class Schema::PaymentSummaryPaymentSummaryTotalsSummaryFetchResult < Lockstep::ApiRecord

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

  # The totals for a Payment Summary
  field :summary


  has_many :records, {:class_name=>"Schema::PaymentSummary", :included=>true}
  has_many :aging_summary, {:class_name=>"Schema::SummaryAgingTotals", :included=>true}

end