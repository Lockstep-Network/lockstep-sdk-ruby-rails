class Lockstep::PaymentSummary < Lockstep::ApiRecord
  self.model_name_uri = "v1/Payments/views/summary"
  self.id_ref = "payment_id"
  self.query_path = ""
  load_schema(Schema::PaymentSummary)
end
