class Schema::Application < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # A unique code identifying this application
  # @type: string
  # @format: uuid
  field :app_id

  # The name of this application
  # @type: string
  field :name

  # Brief summary of this application shown as a subtitle
  # @type: string
  field :description

  # Tag for what type of app this is
  # @type: string
  field :app_type

  # The ID of the owner
  # @type: string
  # @format: uuid
  field :owner_id

  # The URL to visit for more information about this application
  # @type: string
  field :project_url

  # The URL for the icon for this application
  # @type: string
  field :icon_url

  # The ID of the user who created this application
  # @type: string
  # @format: uuid
  field :created_user_id

  # The ID of the user who last modified this application
  # @type: string
  # @format: uuid
  field :modified_user_id

  # The date this application was created
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The date this application was last modified
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # Flag indicating if the application is active.
  # @type: boolean
  field :is_active

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The B2C Client ID of the application
  # @type: string
  # @format: uuid
  field :b2_c_client_id

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}

  has_many :notes, {:class_name=>"Lockstep::Note", :included=>true, :foreign_key=>:object_key, :polymorphic=>{:table_key=>"Application"}}
  has_many :attachments, {:class_name=>"Schema::Attachment", :included=>true}
  has_many :custom_field_definitions, {:class_name=>"Schema::CustomFieldDefinition", :included=>true}
  has_many :custom_field_values, {:class_name=>"Schema::CustomFieldValue", :included=>true}
  has_many :enrollments, {:class_name=>"Schema::AppEnrollment", :included=>true}

end