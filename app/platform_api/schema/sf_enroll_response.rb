class Schema::SfEnrollResponse < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Organisation response object.
  field :organisation_response

  # Company response object.
  field :company_response



end