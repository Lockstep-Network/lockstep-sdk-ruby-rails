class Schema::InboundSyncPrimaryContact < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique identifier of this object in the Sage Network platform.
  # @type: string
  # @format: uuid
  field :network_id

  # This is the primary key of the Contact record. For this field, you should use whatever the contact's unique
  # identifying number is in the originating system. Search for a unique, non-changing number within the
  # originating financial system for this record.
  #             
  # Example: If you store your contact records in a database, whatever the primary key for the contact table is
  # in the database should be the "ErpKey".
  #             
  # As some ERP systems don't maintain a unique key for Contacts, we also support syncing Contacts with ERP keys
  # of the form {prefix}|{index}, for example ContactPrefix|1, ContactPrefix|2 and so on.
  #             
  # For this reason, please ensure that your Contact ERP keys don't otherwise contain the '|' symbol or that it
  # is replaced by an alternate symbol if they do.
  #             
  # For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
  # @type: string
  field :erp_key

  # The original primary key or unique ID of the company to which this contact belongs.  This value should
  # match the [Company ErpKey](https://developer.lockstep.io/docs/importing-companies#erpkey) field on the
  # [CompanySyncModel](https://developer.lockstep.io/docs/importing-companies).
  # @type: string
  field :company_erp_key

  # The name of the contact.
  # @type: string
  field :contact_name

  # A friendly human-readable code that describes this Contact.
  # @type: string
  field :contact_code

  # The title of the contact.
  # @type: string
  field :title

  # The role code for the contact.
  # @type: string
  field :role_code

  # The email address of the contact.
  # @type: string
  field :email_address

  # The phone number of the contact.
  # @type: string
  field :phone

  # The fax number of the contact.
  # @type: string
  field :fax

  # The mailing address information for this contact.
  # @type: string
  field :address1

  # The mailing address information for this contact.
  # @type: string
  field :address2

  # The mailing address information for this contact.
  # @type: string
  field :address3

  # The mailing address information for this contact.
  # @type: string
  field :city

  # The mailing address information for this contact.
  # @type: string
  field :state_region

  # The mailing address information for this contact.
  # @type: string
  field :postal_code

  # The mailing address information for this contact.
  # @type: string
  field :country_code

  # True if this contact is considered "active".
  # @type: boolean
  field :is_active

  # A web page URL for more information about this contact.
  # @type: string
  field :webpage_url

  # If available, the URL of a photograph that shows this contact.
  # @type: string
  field :picture_url

  # If known, the date when this record was created according to the originating financial system
  # in which this record is maintained.  If the originating financial system does not maintain a
  # created-date, leave this field null.
  # @type: string
  # @format: date-time
  field :created, Types::Params::DateTime

  # If known, the date when this record was most recently modified according to the originating
  # financial system in which this record is maintained.  If the originating financial system does
  # not maintain a most-recently-modified-date, leave this field null.
  # @type: string
  # @format: date-time
  field :modified, Types::Params::DateTime

  # Enum defining which action to take for a model during the sync process.
  field :on_match_action



end