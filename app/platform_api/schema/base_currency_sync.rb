class Schema::BaseCurrencySync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The default currency code used by this business entity.
  #             
  # For a list of defined currency codes, see [Query Currencies](https://developer.lockstep.io/reference/get_api-v1-definitions-currencies)
  # @type: string
  field :base_currency_code



end