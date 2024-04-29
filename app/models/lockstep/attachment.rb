# frozen_string_literal: true

class Lockstep::Attachment < Lockstep::ApiRecord
  self.model_name_uri = 'v1/Attachments'
  self.id_ref = 'attachment_id'
  load_schema(Schema::Attachment)

  def download_url
    response = resource.get "#{id}/download-url"
    JSON.parse(response.body)['downloadLink']
  end

  def download_file
    response = resource.get "#{id}/download-file"
    response.body
  end
end
