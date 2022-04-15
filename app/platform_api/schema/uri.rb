class Schema::Uri < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Represents the download link
  # @type: string
  # @format: uri
  field :download_link



end