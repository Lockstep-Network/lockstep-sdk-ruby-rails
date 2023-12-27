# frozen_string_literal: true

class Lockstep::Transaction < Lockstep::ApiRecord
  self.model_name_uri = 'v1/Transactions'
  self.id_ref = 'transaction_id'

  load_schema(Schema::Transaction)
end
