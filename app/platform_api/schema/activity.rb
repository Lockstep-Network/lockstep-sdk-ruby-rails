class Schema::Activity < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Lockstep when this record is
  # added to the Lockstep platform.
  # @type: string
  # @format: uuid
  field :activity_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The ID of the company to which this activity belongs.
  # @type: string
  # @format: uuid
  field :company_id

  # The type code of the activity
  # @type: string
  field :activity_type_code

  # The name of the activity.  The name is a short name provided by the
  # person who created the activity that can be displayed in a list.
  # @type: string
  field :activity_name

  # A description of the activity.  This field contains more detailed text about the
  # activity and can be lengthy.
  # @type: string
  field :activity_description

  # The status of the activity.
  # @type: string
  field :activity_status

  # True if this activity is currently "open", which indicates that the activity is
  # currently in progress.
  # @type: boolean
  field :is_open

  # The priority of the activity.
  # @type: string
  field :priority

  # The ID of the user the activity is assigned to.
  # @type: string
  # @format: uuid
  field :user_assigned_to

  # The date the activity was assigned.
  # @type: string
  # @format: date-time
  field :date_assigned, Types::Params::DateTime

  # The date the activity was closed.
  # @type: string
  # @format: date-time
  field :date_closed, Types::Params::DateTime

  # If this activity has been "snoozed", this field will be non-null and will contain
  # the date when the activity will be displayed.  Until that date arrives, the activity
  # will remain hidden.
  # @type: string
  # @format: date-time
  field :snooze_until_date, Types::Params::DateTime

  # The date on which this activity was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID of the user who created this activity.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date on which this activity was last modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID of the user who last modified this activity.
  # @type: string
  # @format: uuid
  field :modified_user_id

  # Amount collected (if any) for the activity.
  # @type: number
  # @format: double
  field :amount_collected

  # Amount paid (if any) for the activity.
  # @type: number
  # @format: double
  field :amount_paid

  # Credit given (if any) for the activity.
  # @type: number
  # @format: double
  field :credit_given

  # True if this activity is to be shown in an "unread" state.  When an activity
  # is read by a person it is assigned to, this flag is set to false.
  # @type: boolean
  field :is_unread

  # Activities may be archived when they should be hidden from the user.  When
  # this flag is true, this activity should be hidden.
  # @type: boolean
  field :is_archived

  # The company associated with the activity
  #             
  # To retrieve this collection, specify `Company` in the "Include" parameter for your query.
  field :company

  # The name of the user the activity is assigned to
  # @type: string
  field :user_assigned_to_name

  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}

  has_many :attachments, {:class_name=>"Schema::Attachment", :included=>true}
  has_many :notes, {:class_name=>"Lockstep::Note", :included=>true, :foreign_key=>:object_key, :polymorphic=>{:table_key=>"Activity"}}
  has_many :custom_field_definitions, {:class_name=>"Schema::CustomFieldDefinition", :included=>true}
  has_many :custom_field_values, {:class_name=>"Schema::CustomFieldValue", :included=>true}
  has_many :references, {:class_name=>"Schema::ActivityXRef", :included=>true}

end