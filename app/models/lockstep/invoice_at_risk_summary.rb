class Lockstep::InvoiceAtRiskSummary < Lockstep::ApiRecord
  self.model_name_uri = "v1/Invoices/views/at-risk-summary"
  self.id_ref = "invoice_id"
  self.query_path = ""
  load_schema(Schema::InvoiceAtRiskSummary)
end
