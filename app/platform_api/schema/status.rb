class Schema::Status < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # If authentication is successful, contains the username of the logged-in user.
  # @type: string
  field :user_name

  # If authentication is successful, contains the email address of the logged-in user.
  # @type: string
  field :email_address

  # If authentication is successful, contains subscription account name of logged-in user.
  # @type: string
  field :account_name

  # If authentication is successful, contains subscription account company id of logged-in user.
  # @type: string
  # @format: uuid
  field :account_company_id

  # If authentication is successful, contains the unique identifier of the logged-in user.
  # @type: string
  # @format: uuid
  field :user_id

  # If authentication is successful, contains the group key of the logged-in user.
  # @type: string
  # @format: uuid
  field :group_key

  # Returns true if authentication for this API was successful.
  # @type: boolean
  field :logged_in

  # The error message.
  # @type: string
  field :error_message

  # The set of roles for this user.
  # @type: array
  field :roles

  # Date and time user has last logged into Azure B2C.
  # @type: string
  # @format: date-time
  field :last_logged_in, Types::Params::DateTime

  # The id of the API key used to authenticate.
  # @type: string
  # @format: uuid
  field :api_key_id

  # If authentication is successful, contains the user status of the logged-in user.
  # @type: string
  field :user_status

  # The environment currently being used
  # @type: string
  field :environment

  # The version currently being used
  # @type: string
  field :version

  # If authentication is successful, contains the onboarding session status of the logged-in user's group account.
  # @type: boolean
  field :onboarding_scheduled

  # Base Currency of the group
  # @type: string
  field :base_currency_code

  # Country code of the group
  # @type: string
  field :country_code

  # The id of the Magic link used to authenticate.
  # @type: string
  # @format: uuid
  field :magic_link_id

  # The id of the target company for the Magic Link
  # @type: string
  # @format: uuid
  field :magic_link_company_id

  # Magic link information about the user
  field :magic_link

  # Information allowing Lockstep to offer direct support to the user
  field :support_access

  # True if the user is being impersonated by the Lockstep support team.
  # @type: boolean
  field :is_impersonated

  # Statuses for the dependencies of this api.
  # OK if the dependency is working.
  # @type: object
  field :dependencies


  has_many :user_groups, {:class_name=>"Schema::UserGroup", :included=>true}

end