class Schema::SyncSubmit < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique identifier of the app enrollment that is creating this sync request.
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # A boolean indicating whether a sync from an ERP system should process all the data from the ERP
  # as opposed to just the delta of changes since the previous sync run. For the Demo Data Connector, setting this
  # to True refreshes the data with new dates as opposed to leaving it unchanged.
  # @type: boolean
  field :run_full_sync



end