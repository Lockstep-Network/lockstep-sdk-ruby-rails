class Schema::EInvoiceAttachment < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Lockstep when this record is added to the platform.
  # @type: string
  field :attachment_id

  # An Attachment represents a file that was uploaded to the Platform.This field contains the original name of the file on disk, without its extension.
  # @type: string
  field :file_name

  # An Attachment represents a file that was uploaded to the Platform.  This field contains the original extension name of the file on disk.
  # @type: string
  field :file_ext

  # A text string describing the type of this Attachment.
  # @type: string
  field :attachment_type



end