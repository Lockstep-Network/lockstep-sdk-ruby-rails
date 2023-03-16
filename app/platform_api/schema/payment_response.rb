class Schema::PaymentResponse < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique identifier of the payment.
  # @type: string
  field :payment_id

  # Date the orginal request was created in ISO 8601 date format.
  # @type: string
  # @format: date-time
  field :create_date_time, Types::Params::DateTime

  # The payment status
  # Values: "UNAUTHORISED" "PENDING" "PAID" "PAID_OFFLINE" "FAILED" "CANCELLED" "REJECTED" "REFUNDED" "PARTIALLY" "PARTIALLY_REFUNDED"
  # @type: string
  field :status

  # A boolean field indicating whether the payment is in a state that can be cancelled.
  # All PENDING payments can be cancelled, but other statuses are provider-dependent.
  # @type: boolean
  field :cancellable

  # Date the request was last updated in ISO 8601 date format.
  # @type: string
  # @format: date-time
  field :update_date_time, Types::Params::DateTime

  # The date when the real-world payment request was initiated
  # (for example, date upon which an invoice was created), ISO-8601 format.
  # If before 1st January, 1970, initiatedDateTime will be set to null.
  # @type: string
  # @format: date-time
  field :initiated_date_time, Types::Params::DateTime

  # Date the payment is due in ISO 8601 date format. If before 1st January, 1970, dueDate will be set to null.
  # @type: string
  # @format: date-time
  field :due_date, Types::Params::DateTime

  # The method that was used to pay an invoice outside of Payments Acceptance.
  # Values: "CASH" "CHEQUE" "DIRECT_CREDIT" "DIRECT_DEBIT" "CARD" "VOUCHER" "CREDIT_NOTE" "UNKNOWN" "OTHER"
  # @type: string
  field :offline_method

  # A free text field for describing offline payment methods not covered by the offlineMethod property.
  # Should only be used with the OTHER offline method.
  # @type: string
  field :other_offline_method

  # Unique identifier assigned by the payment initiator to unambiguously identify the payment.
  # The identifier is passed on, unchanged, throughout the entire end-to-end chain.
  # @type: string
  field :end_to_end_identifier

  # An object that represents an amount of money in a specific currency.
  field :instructed_amount

  # The fee levied by the payment provider for the payment, in minor units of the invoice currency.
  # This will only be available for paid or partially paid invoices.
  # Not all providers will be able to provide fee information, so this field may be null even for paid invoices.
  # Where provided, this field will be non-negative.
  # @type: integer
  # @format: int32
  field :fee

  # Net amount and fees as converted into servicer account currency.
  field :reporting_amount

  # Amount of the payment that has been paid until now.
  # @type: integer
  # @format: int32
  field :paid_to_date

  # Amount of the payment still outstanding (excluding fees/charges). Maximum value is instructed amount.
  # @type: string
  field :outstanding_amount

  # Amount of the payment that has been refunded. Maximum value is instructed amount.
  # @type: string
  field :refunded_amount

  # Array of payment methods which the debtor can choose from in order to pay.
  # Primarily used to populate the PayNow options page (for example, card, PayPal, ACH).
  # @type: array
  field :debtor_payment_methods

  # Details about the creditor requesting the payment.
  field :creditor_account

  # The details about the debtor receiving the payment request.
  field :debtor_account

  # Information supplied to enable the matching of an entry with the items that the transfer is intended to settle,
  # such as a commercial invoice.
  field :remittance_information

  # Information related to the risk of the payment.
  field :risk

  # Base64 encoded strings that when decoded, can be added to html emails to provider markup in supported email clients.
  field :metadata

  # Flag of whether this is a partial payment
  # @type: boolean
  field :partial_payment

  # The type of the payment.
  # Values: "INVOICE" "STATEMENT" "PAY_ON_ACCOUNT"
  # @type: string
  field :type



end