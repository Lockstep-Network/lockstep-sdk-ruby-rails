class Lockstep::Payment < Lockstep::ApiRecord
  self.model_name_uri = "v1/Payments"
  self.id_ref = "payment_id"
  load_schema(Schema::Payment)

  belongs_to :connection, class_name: "Lockstep::Connection", foreign_key: :company_id
end
