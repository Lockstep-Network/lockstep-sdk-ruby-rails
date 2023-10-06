# frozen_string_literal: true

class Lockstep::Invoice < Lockstep::ApiRecord
  self.model_name_uri = 'v1/Invoices'
  self.id_ref = 'invoice_id'
  load_schema(Schema::Invoice)

  belongs_to :connection, class_name: 'Lockstep::Connection', foreign_key: :customer_id

  scope :einvoices, -> { include_object(:customer, :lines) }
  scope :received_einvoices, -> { einvoices.where(invoice_type_code: 'AP E-Invoice') }
end
