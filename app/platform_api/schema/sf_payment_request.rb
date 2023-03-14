class Schema::SfPaymentRequest < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # A unique identifier assigned by the payment initiator to unambiguously identify the payment.
  # The identifier is passed on, unchanged, throughout the entire end-to-end chain.
  # @type: string
  field :end_to_end_identifier

  # A flag to enable or disable partial payments against this payment. False by default.
  # @type: boolean
  field :partial_payment

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

  # An object that represents an amount of money in a specific currency.
  field :instructed_amount

  # An object that represents all the discounts available for a given payment.
  field :settlement_discounts_info

  # Array of payment methods which the debtor can choose from in order to pay.
  # Primarily used to populate the PayNow options page (for example, card, PayPal, ACH).
  # @type: array
  field :debtor_payment_methods

  # The details about the debtor receiving the payment request.
  field :debtor_account

  # The details about the creditor requesting the payment.
  field :creditor_account

  # Information supplied to enable the matching of an entry with the items that the transfer is intended to settle,
  # such as a commercial invoice.
  field :remittance_information

  # Information related to the risk of the payment.
  field :risk

  # Success redirect url.
  # @type: string
  field :success_redirect_url

  # Failure redirect url.
  # @type: string
  field :failure_redirect_url

  # An arbitrary dictionary of key-value data to be sent to the payment provider. May be null or empty.
  # @type: object
  field :prepare_data



end