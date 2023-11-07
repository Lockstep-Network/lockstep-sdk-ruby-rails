class Lockstep::Connection < Lockstep::ApiRecord
  self.model_name_uri = 'v1/Companies'
  self.id_ref = 'company_id'
  load_schema(Schema::Company)

  enum company_type: ['Customer', 'Vendor', 'Group', 'Company', 'Third Party'].freeze

  has_many :contacts, class_name: 'Lockstep::Contact', included: true
  belongs_to :created_user, class_name: 'Lockstep::User', foreign_key: :created_user_id, primary_key: :user_id
  belongs_to :modified_user, class_name: 'Lockstep::User', foreign_key: :modified_user_id, primary_key: :user_id

  validates :company_name, presence: true

  default_scope { where(company_type: %w[Customer Vendor Group Company CompanyProfile]).or(where(company_type: nil)) }

  scope :customers, -> { where(company_type: 'Customer') }
  scope :vendors, -> { where(company_type: 'Vendor') }
  scope :internal_connections, -> { where(company_type: 'Company') }
  scope :company_profiles, -> { where(company_type: 'CompanyProfile') }
  scope :company_type_null, -> { where(company_type: nil) }
end
