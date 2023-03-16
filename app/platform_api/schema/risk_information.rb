class Schema::RiskInformation < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Enum: "person-to-person" "e-commerce-goods" "e-commerce-services" "bill-payment" "other"
  # Payment Context Code.
  # @type: string
  field :payment_context_code

  # Category code confirming to ISO 18245, related to the type of services or goods the merchant provides for the transaction.
  # @type: string
  field :merchant_category_code

  # Address of a Company, Provider or Customer
  field :delivery_address



end