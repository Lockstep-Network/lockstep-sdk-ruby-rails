class Schema::RelationshipDetail < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end


  has_many :data, {:class_name=>"Schema::JsonApiResourceHead", :included=>true}

end