class Schema::Email < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Lockstep when this record is
  # added to the Lockstep platform.
  # @type: string
  # @format: uuid
  field :email_id

  # The unique ID number of this email's conversation thread.
  # @type: string
  # @format: uuid
  field :thread_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The ID number of the company that created this email.
  # @type: string
  # @format: uuid
  field :company_id

  # The email address for the sender of this email.
  # @type: string
  field :email_from

  # The email address for the recipient(s) of this email.
  # @type: string
  field :email_to

  # The email address for the CC recipient(s) of this email
  # @type: string
  field :email_cc

  # The subject line of this email.
  # @type: string
  field :email_subject

  # The body content of this email.
  # @type: string
  field :email_body

  # The date on which this email was sent.
  # @type: string
  # @format: date-time
  field :sent_date, Types::Params::DateTime

  # A status flag indicating if this email is unread.
  # @type: boolean
  field :is_unread

  # A status flag indicating if this email is priority status.
  # @type: boolean
  field :is_priority

  # A status flag indicating if this email is marked as spam.
  # @type: boolean
  field :is_spam

  # The date on which this email was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID number of the user who created this email.
  # @type: string
  # @format: uuid
  field :created_user_id

  # A status flag indicating if this email is to be sent.
  # @type: boolean
  field :to_be_sent

  # The ID number of the customer that sent this email.
  # @type: string
  # @format: uuid
  field :customer_id

  # The date on which this email was received.
  # @type: string
  # @format: date-time
  field :received_time_stamp, Types::Params::DateTime

  # The date on which this email was opened.
  # @type: string
  # @format: date-time
  field :opened_timestamp, Types::Params::DateTime

  # The number of times this email was viewed.
  # @type: integer
  # @format: int32
  field :view_count

  # The AppEnrollmentId of the application that imported this record.  For accounts
  # with more than one financial system connected, this field identifies the originating
  # financial system that produced this record.  This value is null if this record
  # was not loaded from an external ERP or financial system.
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # The id of the email in an external system if imported.
  # @type: string
  field :external_email_id

  # The id of the email thread in an external system if imported.
  # @type: string
  field :external_thread_id

  # The email address(es) for the BCC recipient(s) of this email
  # @type: string
  field :email_bcc

  # The type message being sent (New, Reply, Forward) or null for messages not being sent.
  # @type: string
  field :send_type

  # The date on which this email was modified.
  # Email modification should only be done by internal services.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID of the user who modified this email.
  # Email modification should only be done by internal services.
  # @type: string
  # @format: uuid
  field :modified_user_id

  # If the message being sent is a reply or a forward, the id of the the email being replied to or forwarded.
  # Otherwise null.
  # @type: string
  # @format: uuid
  field :response_origin_id

  # The email object associated with the response origin id.
  field :response_origin

  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :customer, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}
  belongs_to :connection, {:class_name=>"Lockstep::Connection", :primary_key=>:company_id, :foreign_key=>"customer_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}

  has_many :notes, {:class_name=>"Lockstep::Note", :included=>true, :foreign_key=>:object_key, :polymorphic=>{:table_key=>"Email"}}
  has_many :attachments, {:class_name=>"Schema::Attachment", :included=>true}
  has_many :custom_field_definitions, {:class_name=>"Schema::CustomFieldDefinition", :included=>true}
  has_many :custom_field_values, {:class_name=>"Schema::CustomFieldValue", :included=>true}

end