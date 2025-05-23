class Lockstep::CustomFieldValue < Lockstep::ApiRecord
  self.model_name_uri = 'v1/CustomFieldValues'
  self.id_ref = 'custom_field_definition_id'
  load_schema(Schema::CustomFieldValue)

  def update(attributes = {})
    attributes = HashWithIndifferentAccess.new(attributes)

    @unsaved_attributes.merge!(attributes)
    attrs = attributes_for_saving.transform_keys { |key| key.camelize(:lower) }

    # Label with CustomerLocale to be updated from here
    resp = resource.patch("CustomerLocale/#{attributes[:record_key]}", body: attrs)
    result = post_result(resp)
  end

end
