class Schema::DeveloperAccountSubmit < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The first name of the person requesting the developer account.
  # @type: string
  field :first_name

  # The last name of the person requesting the developer account.
  # @type: string
  field :last_name

  # The email address of the developer.
  # @type: string
  # @format: email
  field :email

  # The company name of the developer.
  # @type: string
  field :company_name



end