class Schema::AttachmentHeaderInfo < Lockstep::ApiRecord

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

  # The CompanyId associated with the attachment status report. Providing a null value will
  # return an attachment summary for all attachments associated to the provided GroupKey
  # @type: string
  # @format: uuid
  field :company_id

  # The total number of attachments associated with the provided GroupKey and CompanyId.
  # @type: integer
  # @format: int32
  field :total_attachments

  # The total number of archived attachments associated with the provided GroupKey and CompanyId.
  # @type: integer
  # @format: int32
  field :total_archived

  # The total number of active attachments associated with the provided GroupKey and CompanyId.
  # @type: integer
  # @format: int32
  field :total_active

  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}


end