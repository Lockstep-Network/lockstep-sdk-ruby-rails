class Schema::SfEnrollRequest < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # Organisation request object.
  field :organisation_request

  # Company request object.
  field :company_request



end