class Schema::SyncPayload < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end


  has_many :payments, {:class_name=>"Schema::InboundPaymentSync", :included=>true}
  has_many :invoices, {:class_name=>"Schema::InboundInvoiceSync", :included=>true}
  has_many :companies, {:class_name=>"Schema::InboundCompanySync", :included=>true}

end