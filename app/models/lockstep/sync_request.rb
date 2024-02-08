class Lockstep::SyncRequest < Lockstep::ApiRecord
  self.model_name_uri = 'v1/Sync'
  self.id_ref = 'sync_request_id'

  load_schema(Schema::SyncRequest)
end
