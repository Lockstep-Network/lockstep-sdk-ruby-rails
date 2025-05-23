class Schema::WorkflowStatus < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Accounting Data Service when this record is
  # added to the Accounting Data Services network.
  # @type: string
  # @format: uuid
  field :id

  # The name of the workflow status.
  # @type: string
  field :name

  # The description explaining the use of the workflow status.
  # @type: string
  field :description

  # The prior workflow status ID.
  # @type: string
  # @format: uuid
  field :parent_workflow_status_id

  # The category of the workflow status.
  # @type: string
  field :category

  # The code of the workflow status.
  # @type: string
  field :code

  # Indicates whether notes are required or not.
  # @type: boolean
  field :is_notes_required

  # Indicates whether a reason is required or not.
  # @type: boolean
  field :is_reason_required

  # Indicates whether the status change should be reported to the ERP or not.
  # @type: boolean
  field :promote_to_erp

  # Possible sources for a Workflow Status.
  field :status_source

  # The date that the workflow status was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID of the user who created the workflow status.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date that the workflow status was last modified.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID of the user who last modified the workflow status.
  # @type: string
  # @format: uuid
  field :modified_user_id

  belongs_to :parent_workflow_status, {:class_name=>"Lockstep::WorkflowStatus", :primary_key=>:id, :foreign_key=>"parent_workflow_status_id"}
  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}

  has_many :parents, {:class_name=>"Schema::WorkflowStatus", :included=>true}
  has_many :children, {:class_name=>"Schema::WorkflowStatus", :included=>true}

end