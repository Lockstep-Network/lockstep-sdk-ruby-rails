class Schema::ConnectorInfo < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The realm id of the account being granted permissions to access
  # @type: string
  field :realm_id

  # The username of the web services account with access permissions.
  # @type: string
  field :username

  # The password for the web services account with access permissions.
  # @type: string
  field :password



end