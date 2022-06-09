class Lockstep::Webhook < Lockstep::ApiRecord
  self.model_name_uri = "/v1/Webhooks/"
  self.id_ref = "webhook_id"
  load_schema(Schema::Webhook)
end