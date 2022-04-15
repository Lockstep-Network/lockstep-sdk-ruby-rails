class Schema::BatchSync < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end


  has_many :companies, {:class_name=>"Schema::CompanySync", :included=>true}
  has_many :contacts, {:class_name=>"Schema::ContactSync", :included=>true}
  has_many :credit_memo_applications, {:class_name=>"Schema::CreditMemoAppliedSync", :included=>true}
  has_many :invoices, {:class_name=>"Schema::InvoiceSync", :included=>true}
  has_many :invoice_lines, {:class_name=>"Schema::InvoiceLineSync", :included=>true}
  has_many :custom_fields, {:class_name=>"Schema::CustomFieldSync", :included=>true}
  has_many :payments, {:class_name=>"Schema::PaymentSync", :included=>true}
  has_many :payment_applications, {:class_name=>"Schema::PaymentAppliedSync", :included=>true}

end