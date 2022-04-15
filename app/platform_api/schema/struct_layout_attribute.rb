class Schema::StructLayoutAttribute < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  
  field :type_id

  
  field :value



end