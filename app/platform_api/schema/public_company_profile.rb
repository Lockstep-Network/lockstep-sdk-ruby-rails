class Schema::PublicCompanyProfile < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of the company associated with this profile.
  # @type: string
  # @format: uuid
  field :company_id

  # The short name of the company associated with this profile.
  # @type: string
  field :company_name

  # The URL of this company's logo, if known.
  # @type: string
  field :company_logo_url

  # Website URL for the company associated with this profile.
  # @type: string
  field :website

  # Description of the company associated with this profile.
  # @type: string
  field :description

  # The public url slug for this Public Company Profile.
  # @type: string
  field :public_url_slug

  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}


end