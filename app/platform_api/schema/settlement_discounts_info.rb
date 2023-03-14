class Schema::SettlementDiscountsInfo < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Value: "beforeTax"
  # How taxes are calculated.
  # @type: string
  field :discount_scheme

  # Tax amount being paid in this payment.
  # @type: number
  # @format: double
  field :tax_amount


  has_many :settlement_discounts, {:class_name=>"Schema::SettlementDiscount", :included=>true}

end