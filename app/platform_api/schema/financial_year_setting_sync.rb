class Schema::FinancialYearSettingSync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The type of financial year, either Calendar or Fiscal.
  # @type: string
  field :year_type

  # Total number of periods in the year. For Calendar year types this should always be 12. For Fiscal year types
  # this can either be 12 or 13 for a 4 week 13 period year.
  # @type: integer
  # @format: int32
  field :total_periods

  # The start date of the financial year. Should be entered in MM-DD format.
  # @type: string
  field :start_date

  # The end date of the financial year. Should be entered in MM-DD format.
  # @type: string
  field :end_date



end