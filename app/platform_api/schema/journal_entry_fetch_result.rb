class Schema::JournalEntryFetchResult < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  
  # @type: integer
  # @format: int32
  field :total_count

  
  # @type: integer
  # @format: int32
  field :page_size

  
  # @type: integer
  # @format: int32
  field :page_number


  has_many :records, {:class_name=>"Schema::JournalEntry", :included=>true}

end