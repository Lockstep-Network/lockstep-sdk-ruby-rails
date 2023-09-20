class Schema::ExternalConnectorAuth < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The URL to open a browser with. This begins the user authentication process driven by a provider.
  # @type: string
  field :authentication_url



end