class Schema::ExternalConnectorAuthRequest < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # An array of scopes requested from 3rd-party provider.
  # @type: array
  field :scopes

  # The URL the browser is redirected to after a user grants, or denies, permissions for Sage software.
  # @type: string
  field :redirect_url

  # Opaque value that a secret will be tagged with on the service side when created
  # @type: string
  field :connection_context_id



end