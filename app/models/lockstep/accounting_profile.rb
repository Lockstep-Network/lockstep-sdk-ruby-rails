class Lockstep::AccountingProfile < Lockstep::ApiRecord
  self.model_name_uri = 'v1/profiles/accounting'
  self.id_ref = 'contact_id'
  load_schema(Schema::AccountingProfile)


  belongs_to :connection, class_name: 'Lockstep::Connection', included: true
end
