class Schema::GroupAccount < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The name of the group
  # @type: string
  field :group_name

  # The primary user for the group
  # @type: string
  # @format: uuid
  field :primary_user_id

  # The CompanyId of the Company the group is associated with
  # @type: string
  # @format: uuid
  field :group_company_id

  # Base Currency of the group
  # @type: string
  field :base_currency_code

  # The active status of the group
  # @type: boolean
  field :is_active

  # The onboarding session status of the group
  # @type: boolean
  field :onboarding_scheduled

  # The date this group account was created
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID of the user who created this group account
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date this group account was last modified
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID of the user who last modified this group account
  # @type: string
  # @format: uuid
  field :modified_user_id

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}


end