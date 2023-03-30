class Lockstep::ServiceFabricPayment < Lockstep::ApiRecord
  self.model_name_uri = "v1/payments-acceptance/payments/"
  self.id_ref = ""
  self.query_path=""
  load_schema(Schema::SfPaymentRequest)

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

  # Overriding This method to not send body inside an Array
  def create
    attrs = attributes_for_saving.transform_keys { |key| key.camelize(:lower) }
    resp = resource.post(attrs['creditorAccount']['companyId'], body: attrs)
    result = post_result(resp)
  end

end
