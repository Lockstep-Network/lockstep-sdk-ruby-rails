class Schema::AppEnrollmentReconnectInfo < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The username for the web services account with access permissions.
  # @type: string
  field :username

  # The password for the web services account with access permissions.
  # @type: string
  field :password

  # The Realm Id for the app enrollment to reconnect.
  # @type: string
  field :realm_id



end