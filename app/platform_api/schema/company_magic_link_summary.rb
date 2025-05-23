class Schema::CompanyMagicLinkSummary < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique id for this company
  # @type: string
  # @format: uuid
  field :company_id

  # The short name of the company.
  # @type: string
  field :company_name

  # This field indicates the type of company.  It can be one of a limited number of values:
  # Company, Customer, Group, Vendor, or Third Party.  A company that represents both a customer and a vendor
  # is identified as a CustomerVendor.
  #             
  # * `Company` - This record represents a company that is part of the organization of the account holder.
  # * `Customer` - This record represents a business entity that purchases things from the account holder.
  # * `Group` - Only one record of type `GROUP` exists in each account.  Contains your account profile.
  # * `Vendor` - This record represents a business entity that sells things to the account holder.
  # * `Third Party` - This record represents a business entity that is neither a customer nor vendor.
  # * `CustomerVendor` - Both a customer and a vendor.
  # * `CompanyProfile` - Profile for a Company, each Company should have at most 1 profile, used only for Profile Management.
  # @type: string
  field :company_type

  # The GroupKey uniquely identifies a single Accounting Data Service account.  All records for this
  # account will share the same GroupKey value.  GroupKey values cannot be changed once created.
  #             
  # For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
  # @type: string
  # @format: uuid
  field :group_key

  # The name of the primary contact for this company
  # @type: string
  field :primary_contact_name

  # The email of the primary contact for this company
  # @type: string
  field :primary_contact_email_address

  # The point of contact for this company
  # @type: string
  field :point_of_contact

  # The total outstanding amount for this company
  # @type: number
  # @format: double
  field :outstanding_amount

  # The total amount past due for this company
  # @type: number
  # @format: double
  field :amount_past_due

  # The total number of open invoices for this company
  # @type: integer
  # @format: int32
  field :total_open_invoices

  # The total number of invoices that are past due for this company
  # @type: integer
  # @format: int32
  field :past_due

  # Total number of visits for all magic links sent for this company
  # @type: integer
  # @format: int32
  field :total_visits

  # Total number of sent links for this company
  # @type: integer
  # @format: int32
  field :links_sent

  # Created date of the most recent magic link made for this company
  # @type: string
  # @format: date-time
  field :latest_magic_link_date, Types::Params::DateTime

  # Id of the most recent magic link made for this company
  # @type: string
  # @format: uuid
  field :latest_magic_link_id

  # Status of the most recent magic link made for this company
  field :latest_magic_link_status

  # Expiration date of the most recent magic link made for this company
  # @type: string
  # @format: date-time
  field :latest_magic_link_expiration_date, Types::Params::DateTime

  # The currency code associated with this company based on the related invoices and payments.
  # `Multi` - Multiple currency codes are present.
  # @type: string
  field :currency_code

  # The invite status of this company
  # @type: string
  field :invite_status

  # The UTC date and time the invite status was last modified
  # @type: string
  # @format: date-time
  field :invite_status_modified, Types::Params::DateTime

  # The user id of the user who last modified the invite status
  # @type: string
  # @format: uuid
  field :invite_status_modified_user_id

  # This flag indicates whether the company is currently active.
  # @type: boolean
  field :is_active

  belongs_to :company, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}
  belongs_to :account, {:class_name=>"Lockstep::Account", :primary_key=>:company_id, :foreign_key=>"company_id"}


end