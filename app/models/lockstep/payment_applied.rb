class Lockstep::PaymentApplied < Lockstep::ApiRecord
  self.model_name_uri = "v1/payments-applied"
  self.id_ref = "payment_applied_id"
  self.query_path = ""
  load_schema(Schema::PaymentApplied)

  def self.merge_all_attributes(objects, response)
    objects.each_with_index do |item, index|
      next unless response[index]

      new_attributes = response[index].transform_keys { |key| key.underscore }
    end

    true
  end
end