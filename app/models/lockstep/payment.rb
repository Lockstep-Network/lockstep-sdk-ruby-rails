class Lockstep::Payment < Lockstep::ApiRecord
  self.model_name_uri = "v1/Payments"
  self.id_ref = "payment_id"
  load_schema(Schema::Payment)

  belongs_to :connection, class_name: "Lockstep::Connection", foreign_key: :company_id

  # Overriding create to support erp-write in path params
  def create
    if attributes_for_saving.has_key?(:erp_write)
      attributes_for_saving.delete(:erp_write)
      path_params = 'erp-write'
    else
      path_params = ''
    end
    attrs = attributes_for_saving.transform_keys { |key| key.camelize(:lower) }
    resp = resource.post(path_params, body: [attrs])
    result = post_result(resp)
  end
end
