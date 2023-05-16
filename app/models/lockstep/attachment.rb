class Lockstep::Attachment < Lockstep::ApiRecord
  self.model_name_uri = "v1/Attachments"
  self.id_ref = "attachment_id"
  load_schema(Schema::Attachment)
end
