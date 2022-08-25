class Lockstep::Connection < Lockstep::ApiRecord
  self.model_name_uri = "v1/Companies"
  self.id_ref = "company_id"
  load_schema(Schema::Company)

  enum company_type: %w(Customer Vendor Group)

  has_many :contacts, class_name: "Lockstep::Contact", included: true
  belongs_to :created_user, class_name: "Lockstep::User", foreign_key: :created_user_id, primary_key: :user_id
  belongs_to :modified_user, class_name: "Lockstep::User", foreign_key: :modified_user_id, primary_key: :user_id

  validates :company_name, presence: true

  default_scope { where(company_type: %w(Customer Vendor Group)).or(where(company_type: nil)) }

  scope :customers, -> { where(company_type: "Customer") }
  scope :vendors, -> { where(company_type: "Vendor") }
  scope :company_type_null, -> { where(company_type: nil) }
end
