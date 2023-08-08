# frozen_string_literal: true

class SageNetwork::Status < SageNetwork::ApiRecord
  self.model_name_uri = 'api/v2/status'

  def self.ping
    resp = resource.get('ping')
    raise SageNetwork::Exceptions::BadRequestError, 'Endpoint not found' if resp.code == '404'

    resp.body == '"pong"'
  end

  def self.app_info
    resp = resource.get('app-info')
    raise SageNetwork::Exceptions::BadRequestError, 'Endpoint not found' if resp.code == '404'

    status = JSON.parse(resp.body)
    status.deep_transform_keys!(&:underscore).deep_symbolize_keys!
  end

  def self.health
    resp = resource.get('health')
    raise SageNetwork::Exceptions::BadRequestError, 'Endpoint not found' if resp.code == '404'

    status = JSON.parse(resp.body)
    status.deep_transform_keys!(&:underscore).deep_symbolize_keys!
  end
end
