class Schema::DirectoryCompany < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The field indicates the dataset type used to generate the directory company.
  field :data_set

  # Unique identifier of this record based on the dataset.
  # <remarks>
  # Examples of this would be:
  #     * DataSet = Siren, Identifier = string
  #     * DataSet = Siret, Identifier = string
  # </remarks>
  # @type: string
  field :id

  # This field indicates the type of company.
  # @type: string
  field :company_type

  # The name of the directory company entity.
  # @type: string
  field :name

  # Address info
  # @type: string
  field :address1

  # Address info
  # @type: string
  field :address2

  # Address info
  # @type: string
  field :address3

  # Address info
  # @type: string
  field :city

  # Address info
  # @type: string
  field :country

  # Address info
  # @type: string
  field :postal_code

  # Phone number
  # @type: string
  field :phone_number

  # Email address
  # @type: string
  field :email_address

  # The date this directory company entity was created
  # @type: string
  # @format: date-time
  field :created_date_time, Types::Params::DateTime

  # The date this directory company entity was modified
  # @type: string
  # @format: date-time
  field :modified_date_time, Types::Params::DateTime



end