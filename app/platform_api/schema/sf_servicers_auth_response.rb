class Schema::SfServicersAuthResponse < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # A URL that can be used to complete this integration.
  # @type: string
  field :url



end