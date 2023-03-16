class Schema::SfSubmitPaymentInfo < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique identifier of the payment submission transaction.
  # @type: string
  field :payment_submission_id

  # The unique identifier of the payment.
  # @type: string
  field :payment_id

  # Date the original request was created in ISO 8601 date format.
  # @type: string
  # @format: date-time
  field :create_date_time, Types::Params::DateTime

  # Enum: "SUCCEEDED" "PENDING" "DECLINED" "FAILED" "SUBMITTED" "PROCESSING" "DISPUTED" "CANCELLED" "UNKNOWN"
  # Status of the payment submission.
  # @type: string
  field :status

  # Payment method used.
  # @type: string
  field :payment_method_used

  # Reason why the payment submission failed or was rejected.
  # @type: string
  field :failure_reason

  # An object that represents an amount of money in a specific currency.
  field :instructed_amount

  # The fee levied by the payment provider for the payment submission, in minor units of the invoice currency.
  # Not all providers will be able to provide fee information, so this field may be null even for successful payments.
  # Where provided, this field will be non-negative.
  # @type: integer
  # @format: int32
  field :fee

  # Net amount and fees as converted into servicer account currency.
  field :reporting_amount

  # The details about the debtor receiving the payment request.
  field :debtor_account

  # The details about the creditor requesting the payment.
  field :creditor_account



end