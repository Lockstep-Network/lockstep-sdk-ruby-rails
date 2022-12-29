class Lockstep::TranscriptionValidationRequest < Lockstep::ApiRecord
  self.model_name_uri = "v1/Transcriptions/validate"
  self.id_ref = "transcription_validation_request_id"
  load_schema(Schema::TranscriptionValidationRequest)
end