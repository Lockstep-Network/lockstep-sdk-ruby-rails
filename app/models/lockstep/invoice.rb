# frozen_string_literal: true

class Lockstep::Invoice < Lockstep::ApiRecord
  self.model_name_uri = 'v1/Invoices'
  self.id_ref = 'invoice_id'
  load_schema(Schema::Invoice)

  belongs_to :connection, class_name: 'Lockstep::Connection', foreign_key: :customer_id

  scope :einvoices, -> { where(is_e_invoice: true).include_object(:customer, :lines, :attachments) }
  scope :received_einvoices, -> { einvoices.where(invoice_type_code: 'AP Invoice') }
  scope :sent_einvoices, -> { einvoices.where(invoice_type_code: 'AR Invoice') }
end
