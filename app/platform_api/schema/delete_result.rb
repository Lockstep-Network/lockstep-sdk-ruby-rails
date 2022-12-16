class Schema::DeleteResult < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # If the API call produced messages, this element will contain a list of user-visible
  # text strings that contain information about what work occurred in the API.
  # @type: array
  field :messages



end