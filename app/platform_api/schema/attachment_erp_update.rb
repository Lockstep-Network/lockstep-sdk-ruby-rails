class Schema::AttachmentErpUpdate < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of the attachment in the SN Platform.
  # @type: string
  # @format: uuid
  field :network_id

  # The unique ID of the invoice in the SN Platform.
  # @type: string
  # @format: uuid
  field :invoice_network_id

  # The file name of this attachment.
  # @type: string
  field :file_name

  # The file extension of this attachment.
  # @type: string
  field :file_ext

  # A label indicating the type of the attachment
  # @type: string
  field :attachment_type



end