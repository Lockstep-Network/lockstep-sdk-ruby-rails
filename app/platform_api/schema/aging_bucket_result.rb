class Schema::AgingBucketResult < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The different buckets used for aging.
  field :bucket

  # The outstanding amount for the given bucket in the group's base currency.
  # @type: number
  # @format: double
  field :value



end