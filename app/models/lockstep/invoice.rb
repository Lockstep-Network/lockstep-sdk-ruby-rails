# frozen_string_literal: true

class Lockstep::Invoice < Lockstep::ApiRecord
  self.model_name_uri = 'v1/Invoices'
  self.id_ref = 'invoice_id'
  load_schema(Schema::Invoice)

  belongs_to :connection, class_name: 'Lockstep::Connection', foreign_key: :customer_id

  scope :received_einvoices, -> { where(invoice_type_code: 'AP E-Invoice').include_object(:customer, :lines) }
end
