class Schema::TranscriptionRequestSubmit < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The base64 string of document content
  # @type: string
  field :file_content

  # The location of the file provided
  # @type: string
  field :file_url

  # The location of the file provided
  # @type: string
  field :file_content_url

  # The name of the file provided
  # @type: string
  field :file_name

  # The type of TranscriptionRequestSubmit.InvoiceTypeCode requested to transcribe content to.
  # @type: string
  field :invoice_type_code

  # Group account transcription validation request item is associated with.
  # @type: string
  # @format: uuid
  field :transcription_validation_request_id



end