class Schema::FinancialReportCell < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The value of the financial report cell
  # @type: string
  field :value



end