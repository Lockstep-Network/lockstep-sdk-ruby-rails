class Lockstep::Status
  Lockstep::ApiRecord.model_name_uri = 'v1/Status'

  def self.ping(query_params = {})
    resp = Lockstep::ApiRecord.resource.get('', params: query_params)
    raise Lockstep::Exceptions::BadRequestError, 'Endpoint not found' if resp.code == '404'

    status = JSON.parse(resp.body)
    raise Lockstep::Exceptions::UnauthorizedError, status['errorMessage'] unless status['loggedIn']

    status.deep_transform_keys!(&:underscore).deep_symbolize_keys!
  end
end
