class Lockstep::Account < Lockstep::ApiRecord
  self.model_name_uri = "v1/Companies"
  self.id_ref = "company_id"
  load_schema(Schema::Company)

  enum company_type: %w(Group)

  has_many :connections, class_name: "Lockstep::Connection", included: false, loader: ->(account) { Lockstep::Connection.all }
  has_many :contacts, class_name: "Lockstep::Contact", included: false, loader: ->(account) { Lockstep::Contact.all }
  has_many :users, class_name: "Lockstep::User", included: false

  validates :company_name, presence: true

  default_scope { where(company_type: %w(Group)) }
end
