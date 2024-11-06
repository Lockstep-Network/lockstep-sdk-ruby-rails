class Schema::InvoiceWorkflowStatusSync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # This is the primary key of the Invoice record. For this field, you should use whatever the invoice's unique
  # identifying number is in the originating system. Search for a unique, non-changing number within the
  # originating financial system for this record.
  #             
  # Example: If you store your invoice records in a database, whatever the primary key for the invoice table is
  # in the database should be the "ErpKey".
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :invoice_erp_key

  # Workflow status of the invoice.
  # @type: string
  # @format: uuid
  field :workflow_status_id

  # Notes associated to workflow status
  # @type: string
  field :notes

  # Workflow status code dictated by government standards
  # @type: string
  field :code

  # The date when the workflow status was updated for the e-invoice
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime



end