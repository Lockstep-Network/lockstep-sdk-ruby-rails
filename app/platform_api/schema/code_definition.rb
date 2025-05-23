class Schema::CodeDefinition < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique ID of this record, automatically assigned by ADS when this record is
  # added to the Accounting Data Service.
  # @type: string
  # @format: uuid
  field :code_definition_id

  # The GroupKey uniquely identifies a single Accounting Data Service account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The type of the Code Definition
  # @type: string
  field :code_type

  # The Code to be defined.
  # @type: string
  field :code

  # The definition of the Code
  # @type: string
  field :code_description

  # The date that the Code Definition was created
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The ID of the user who created the Code Definition
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date the Code Definition was last modified
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # The ID of the user who last modified the Code Definition
  # @type: string
  # @format: uuid
  field :modified_user_id

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}
  belongs_to :modified_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"modified_user_id"}


end