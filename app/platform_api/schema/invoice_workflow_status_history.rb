class Schema::InvoiceWorkflowStatusHistory < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by Accounting Data Service when this record is
  # added to the Accounting Data Services network.
  # @type: string
  # @format: uuid
  field :invoice_workflow_status_history_id

  # The invoice ID associated with the invoice workflow status history.
  # @type: string
  # @format: uuid
  field :invoice_id

  # The workflow status ID associated with the invoice workflow status history.
  # @type: string
  # @format: uuid
  field :workflow_status_id

  # The workflow status name associated with the invoice workflow status history.
  # @type: string
  field :workflow_status_name

  # The workflow transition ID associated with the invoice workflow status history.
  # @type: string
  # @format: uuid
  field :workflow_transition_id

  # The GroupKey uniquely identifies a single Accounting Data Services Network account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The notes for the invoice workflow status history.
  # @type: string
  field :workflow_status_notes

  # The reason code for the invoice workflow status history.
  #             
  # Specific reason codes are defined by the workflow status.
  # @type: string
  field :workflow_status_reason_code

  # The date that the invoice workflow status history was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID of the user who created the invoice workflow status history.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The TraceId of the call made to create the invoice workflow status history.
  # @type: string
  field :trace_id

  # The span id of the parent call to create the invoice workflow status history.
  # @type: string
  field :trace_parent

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}


end