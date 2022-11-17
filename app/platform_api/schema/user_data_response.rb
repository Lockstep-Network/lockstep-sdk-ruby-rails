class Schema::UserDataResponse < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Data about the user, the properties returned will depend on the requested information.
  # @type: object
  field :data

  # The Lockstep Platform ID of the user
  # @type: string
  # @format: uuid
  field :user_id



end