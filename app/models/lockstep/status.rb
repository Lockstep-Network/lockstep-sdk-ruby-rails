class Lockstep::Status < Lockstep::ApiRecord
  self.model_name_uri = 'v1/Status'

  def self.ping
    resp = resource.get('')
    raise Lockstep::Exceptions::BadRequestError, 'Endpoint not found' if resp.code == '404'

    status = JSON.parse(resp.body)
    raise Lockstep::Exceptions::UnauthorizedError, status['errorMessage'] unless status['loggedIn']

    status.transform_keys!(&:underscore)
    status['user_groups'].each { |group| group.transform_keys!(&:underscore) }

    status
  end
end
