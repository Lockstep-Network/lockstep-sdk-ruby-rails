# frozen_string_literal: true

class Lockstep::WorkflowStatus < Lockstep::ApiRecord
  self.model_name_uri = '/v1/workflow-statuses/'
  self.id_ref = 'id'

  load_schema(Schema::WorkflowStatus)
end
