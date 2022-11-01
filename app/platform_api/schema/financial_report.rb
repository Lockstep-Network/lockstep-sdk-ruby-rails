class Schema::FinancialReport < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The name of the report ("*Report Type* for *Company*")
  # @type: string
  field :report_name

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The start date of the financial report
  # @type: string
  # @format: date-time
  field :report_start_date, Types::Params::DateTime

  # The end date of the financial report
  # @type: string
  # @format: date-time
  field :report_end_date, Types::Params::DateTime

  # The created date of the financial report
  # @type: string
  # @format: date-time
  field :report_created_date, Types::Params::DateTime


  has_many :rows, {:class_name=>"Schema::FinancialReportRow", :included=>true}

end