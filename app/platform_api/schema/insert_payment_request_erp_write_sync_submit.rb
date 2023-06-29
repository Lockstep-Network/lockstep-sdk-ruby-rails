class Schema::InsertPaymentRequestErpWriteSyncSubmit < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The connected App Enrollment id.
  # @type: string
  # @format: uuid
  field :app_enrollment_id


  has_many :requests, {:class_name=>"Schema::InsertPaymentRequest", :included=>true}

end