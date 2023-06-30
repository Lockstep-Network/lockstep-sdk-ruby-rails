class Schema::PaymentErpWriteResult < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The id of the connected AppEnrollmentModel
  # @type: string
  # @format: uuid
  field :app_enrollment_id

  # The ErpKey for the object written to the Erp if created
  # @type: string
  field :erp_key

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # An optional message to return with the result
  # @type: string
  field :message

  # The id of the SyncRequestModel the requests were added to
  # @type: string
  # @format: uuid
  field :sync_request_id


  has_many :results, {:class_name=>"Schema::Payment", :included=>true}

end

