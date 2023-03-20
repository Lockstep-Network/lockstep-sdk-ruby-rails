class Lockstep::PaymentApplied < Lockstep::ApiRecord
  self.model_name_uri = "v1/payments-applied"
  self.id_ref = "payment_applied_id"
  self.query_path = ""
  load_schema(Schema::PaymentApplied)
end