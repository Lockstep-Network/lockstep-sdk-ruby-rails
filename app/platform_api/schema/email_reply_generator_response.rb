class Schema::EmailReplyGeneratorResponse < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The id for this request in the GMS system
  # @type: string
  # @format: uuid
  field :message_id


  has_many :suggestions, {:class_name=>"Schema::EmailReplyGeneratorSuggestions", :included=>true}

end