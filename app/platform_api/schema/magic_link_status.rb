class Schema::MagicLinkStatus < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The id of the Magic link used to authenticate.
  # @type: string
  # @format: uuid
  field :magic_link_id

  # The id of the application for the Magic Link
  # @type: string
  # @format: uuid
  field :application_id

  # The id of the target company for the Magic Link
  # @type: string
  # @format: uuid
  field :company_id

  # The id of the accounting profile for the Magic Link
  # @type: string
  # @format: uuid
  field :accounting_profile_id

  # The UTC date and time when this magic link expires.
  # @type: string
  # @format: date-time
  field :expires, Types::Params::DateTime

  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}


end