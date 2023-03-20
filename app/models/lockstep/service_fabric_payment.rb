class Lockstep::ServiceFabricPayment < Lockstep::ApiRecord
  self.model_name_uri = "v1/payments-acceptance/payments/"
  self.id_ref = "end_to_end_identifier"
  self.query_path=""
  load_schema(Schema::SfPaymentRequest)
  
  def persisted?
    false
  end

  def attributes_for_saving
    @unsaved_attributes = pointerize(@unsaved_attributes)
    put_attrs = @unsaved_attributes

    put_attrs = relations_for_saving(put_attrs)
    put_attrs.delete('created')
    put_attrs.delete('modified')
    put_attrs
  end

end
