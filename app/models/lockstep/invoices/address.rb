class Lockstep::Invoices::Address < Lockstep::ApiRecord
  self.id_ref = "invoice_address_id"

  field :invoice_address_id
  field :group_key
  field :invoice_id
  field :line1
  field :line2
  field :line3
  field :city
  field :region
  field :postal_code
  field :country
  field :latitude
  field :longitude
  field :created, Types::Params::DateTime
  field :created_user_id
  field :modified, Types::Params::DateTime
  field :modified_user_id
  field :app_enrollment_id

  belongs_to :created_user, class_name: "Lockstep::User", foreign_key: :created_user_id, primary_key: :user_id
  belongs_to :modified_user, class_name: "Lockstep::User", foreign_key: :modified_user_id, primary_key: :user_id
end
