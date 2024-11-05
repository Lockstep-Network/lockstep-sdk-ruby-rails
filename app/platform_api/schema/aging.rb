class Schema::Aging < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The Group Key the aging data is calculated for.
  # @type: string
  # @format: uuid
  field :group_key

  # The total AR outstanding amount in the group's base currency.
  # @type: number
  # @format: double
  field :total


  has_many :buckets, {:class_name=>"Schema::AgingBucketResult", :included=>true}

end