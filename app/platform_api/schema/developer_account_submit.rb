class Schema::DeveloperAccountSubmit < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The name of the developer.
  # @type: string
  field :name

  # The email address of the developer.
  # @type: string
  # @format: email
  field :email

  # The company name of the developer.
  # @type: string
  field :company_name



end