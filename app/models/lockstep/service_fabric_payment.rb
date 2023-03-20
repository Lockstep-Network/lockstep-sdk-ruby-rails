class Lockstep::ServiceFabricPayment < Lockstep::ApiRecord
  self.model_name_uri = "v1/payments-acceptance/payments/"
  self.id_ref = "end_to_end_identifier"
  self.query_path=""
  load_schema(Schema::SfPaymentRequest)
  
  # Returning alwas false becase if id_ref is present in
  # request body it returns true but in this model id_ref
  # is required field in request body
  # TODO: Make it generic 
  def persisted?
    false
  end

  # Preventing deletion of id_ref from puts_attrs because
  # id_ref column is required to send in body in case of
  # create ServiceFabricPayment
  # TODO: Make it generic
  def attributes_for_saving
    @unsaved_attributes = pointerize(@unsaved_attributes)
    put_attrs = @unsaved_attributes

    put_attrs = relations_for_saving(put_attrs)
    put_attrs.delete('created')
    put_attrs.delete('modified')
    put_attrs
  end

end
