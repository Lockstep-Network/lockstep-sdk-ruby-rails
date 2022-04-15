class Schema::SyncSubmit < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique identifier of the app enrollment that is creating this sync request.
  # @type: string
  # @format: uuid
  field :app_enrollment_id



end