# frozen_string_literal: true

class Lockstep::WorkflowStatus < Lockstep::ApiRecord
  self.model_name_uri = '/v1/workflow-statuses/'
  self.id_ref = 'id'

  load_schema(Schema::WorkflowStatus)

  def self.retrieve_by_id_with_children(id)
    resp = resource.get("#{id}", params: { include: :children })
    parsed_response = JSON.parse(resp.body)
    
    case resp.code.to_s
    when '401'
      raise Lockstep::Exceptions::UnauthorizedError, parsed_response['title']
    when '400'
      raise Lockstep::Exceptions::BadRequestError, parsed_response['title']
    when '404'
      raise Lockstep::Exceptions::RecordNotFound, parsed_response['title']
    when '200'
      parsed_response.deep_transform_keys(&:underscore)
    else
      raise Lockstep::Exceptions::BadRequestError, parsed_response
    end
  end
end
