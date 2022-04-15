class Schema::RiskRate < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  # 
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The month the risk rate was calculated for
  # @type: string
  # @format: date-time
  field :report_period, Types::Params::DateTime

  # The string name of the month the risk rate was calculated for
  # @type: string
  field :invoice_month_name

  # The count of all invoices in the calculation month
  # @type: integer
  # @format: int32
  field :total_invoice_count

  # The sum of the total amount for invoices in the calculation month
  # @type: number
  # @format: double
  field :total_invoice_amount

  # The count of open invoices over 90 days from the calculation month
  # @type: integer
  # @format: int32
  field :at_risk_count

  # The sum of the outstanding balance of open invoices over 90 days from the calculation month
  # @type: number
  # @format: double
  field :at_risk_amount

  # The percentage of all open invoices for the calculation month that are over 90 days based on count
  # @type: number
  # @format: double
  field :at_risk_count_percentage

  # The percentage of all open invoices for the calculation month that are over 90 days based on outstanding balance
  # @type: number
  # @format: double
  field :at_risk_percentage



end