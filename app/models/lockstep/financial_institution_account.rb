class Lockstep::FinancialInstitutionAccount < Lockstep::ApiRecord
  self.model_name_uri = "v1/financial-institution-accounts"
  self.id_ref = "financial_institution_account_id"
  self.query_path = ""
  load_schema(Schema::FinancialInstitutionAccount)
end
