class Lockstep::CustomFieldValue < Lockstep::ApiRecord
  self.model_name_uri = 'v1/CustomFieldValues'
  self.id_ref = 'custom_field_definition_id'
  load_schema(Schema::CustomFieldValue)
end
