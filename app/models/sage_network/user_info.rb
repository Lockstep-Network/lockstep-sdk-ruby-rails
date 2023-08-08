# frozen_string_literal: true

class SageNetwork::UserInfo < SageNetwork::ApiRecord
  self.model_name_uri = 'api/v2/userinfo'

  def self.get
    resp = resource.get('')
    raise SageNetwork::Exceptions::BadRequestError, 'Endpoint not found' if resp.code == '404'
    raise SageNetwork::Exceptions::UnauthorizedError if resp.code == '401'

    status = JSON.parse(resp.body)
    status.deep_transform_keys!(&:underscore).deep_symbolize_keys!
  end
end
