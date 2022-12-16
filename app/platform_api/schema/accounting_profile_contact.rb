class Schema::AccountingProfileContact < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Lockstep when this record is
  # added to the Lockstep platform.
  # @type: string
  # @format: uuid
  field :accounting_profile_contact_id

  # The ID of the profile this contact is belongs to.
  # @type: string
  # @format: uuid
  field :accounting_profile_id

  # The ID of the contact that is linked to this profile.
  # @type: string
  # @format: uuid
  field :contact_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The date on which this record was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID of the user who created this contact.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date on which this record was last modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID of the user who last modified this contact.
  # @type: string
  # @format: uuid
  field :modified_user_id

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}


end