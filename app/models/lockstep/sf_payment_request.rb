class Lockstep::ServiceFabricPayment < Lockstep::ApiRecord
  self.model_name_uri = "v1/payments-acceptance/payments/"
  self.id_ref = "end_to_end_identifier"
  self.query_path=""
  load_schema(Schema::SfPaymentRequest)

end
