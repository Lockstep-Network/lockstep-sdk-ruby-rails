class Schema::ApiKey < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique identifier for the API key.
  # @type: string
  # @format: uuid
  field :api_key_id

  # The GroupKey uniquely identifies a single Lockstep Platform account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The name of the API key.
  # @type: string
  field :name

  # For convenience, a call to createApiKey will contain the name of the environment for this API key,
  # typically SBX or PRD. This can help you distinguish between keys created on the Sandbox environment
  # from those created on Production.
  # @type: string
  field :environment

  # The API key to use for authentication. This will only be returned upon creation of the API key.
  # All other times, this value will be `null`.
  #             
  # For more information, see [API Keys](https://developer.lockstep.io/docs/api-keys).
  # @type: string
  field :api_key

  # The first 10 characters of the API key.  This information can be used to ensure that you are
  # looking at the correct API Key, but cannot be used for authentication.
  # @type: string
  field :key_prefix

  # The date the API key was created.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # The user that created the API key.
  # @type: string
  # @format: uuid
  field :created_user_id

  # The date the API key was revoked.
  # @type: string
  # @format: date-time
  field :revoked, Types::Params::DateTime

  # The user who revoked the API key.
  # @type: string
  # @format: uuid
  field :revoked_user_id

  # The UTC datetime when the API key expires.
  # @type: string
  # @format: date-time
  field :expires, Types::Params::DateTime

  belongs_to :created_user, {:class_name=>"Lockstep::User", :primary_key=>:user_id, :foreign_key=>"created_user_id"}


end