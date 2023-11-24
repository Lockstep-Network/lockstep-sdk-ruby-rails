class Schema::InboundSyncReportDataJsonApiData < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Json API data.
  field :data



end