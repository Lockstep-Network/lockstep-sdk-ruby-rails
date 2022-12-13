class Lockstep::Contact < Lockstep::ApiRecord
  self.model_name_uri = 'v1/Contacts'
  self.id_ref = 'contact_id'
  load_schema(Schema::Contact)

  validates :email_address, presence: true

  belongs_to :connection, class_name: 'Lockstep::Connection', included: true
end
