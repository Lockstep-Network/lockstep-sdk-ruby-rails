# frozen_string_literal: true

class Lockstep::Invoice < Lockstep::ApiRecord
  self.model_name_uri = 'v1/Invoices'
  self.id_ref = 'invoice_id'
  load_schema(Schema::Invoice)

  belongs_to :connection, class_name: 'Lockstep::Connection', foreign_key: :customer_id
  belongs_to :customer_primary_contact, {:class_name=>"Lockstep::Contact", :included=>true}

  scope :einvoices, -> { where(is_e_invoice: true).include_object(:customer, :lines, :attachments) }
  scope :received_einvoices, -> { einvoices.where(invoice_type_code: 'AP Invoice') }
  scope :sent_einvoices, -> { einvoices.where(invoice_type_code: 'AR Invoice') }

  def download_pdf
    response = resource.get "#{id}/pdf"
    response.body
  end
end
