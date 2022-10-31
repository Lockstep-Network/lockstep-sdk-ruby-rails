class Schema::FinancialReportRow < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Describes what type of row this row is (Header, Summary, Classification, Category, Subcategory, Data)
  # @type: string
  field :row_type

  # The label for the row if it is a Classification, Category, or Subcategory.
  # @type: string
  field :label


  has_many :rows, {:class_name=>"Schema::FinancialReportRow", :included=>true}
  has_many :cells, {:class_name=>"Schema::FinancialReportCell", :included=>true}

end