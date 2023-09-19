class Schema::MagicLink < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Lockstep when this record is
  # added to the Lockstep platform.
  # @type: string
  # @format: uuid
  field :magic_link_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  # @type: string
  # @format: uuid
  field :group_key

  # The unique ID of the user that this magic link is associated with.
  # @type: string
  # @format: uuid
  field :user_id

  # The ID of the user role for the magic link.
  # @type: string
  # @format: uuid
  field :user_role

  # The ID of the application for this magic link.
  # @type: string
  # @format: uuid
  field :application_id

  # The UTC date and time when this magic link expires.
  # @type: string
  # @format: date-time
  field :expires, Types::Params::DateTime

  # The UTC date and time when this magic link was revoked.
  # @type: string
  # @format: date-time
  field :revoked, Types::Params::DateTime

  # The date that the magic link was created
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID of the user who created the magic link
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date that the magic link was last modified
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID of the user who last modified the magic link
  # @type: string
  # @format: uuid
  field :modified_user_id

  # The ID of the company associated to this magic link
  # @type: string
  # @format: uuid
  field :company_id

  # The ID of the accounting profile associated to this magic link
  # @type: string
  # @format: uuid
  field :accounting_profile_id

  # The created magic link URL. This will only be returned upon creation of the magic link.
  # All other times, this value will be `null`.
  # @type: string
  field :magic_link_url

  # The user associated with this magic link.
  # To retrieve this item, specify `User` in the "Include" parameter for your query.
  field :user

  # The number of visits to this Magic Link
  # @type: integer
  # @format: int32
  field :visits

  # Possible statuses for a Magic Link.
  field :status

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}
  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}


end