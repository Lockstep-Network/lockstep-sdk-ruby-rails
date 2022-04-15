class Lockstep::InvoiceSummary < Lockstep::ApiRecord
  self.model_name_uri = "v1/Invoices/views/summary"
  self.id_ref = "invoice_id"
  self.query_path = ""
  load_schema(Schema::InvoiceSummary)
end
