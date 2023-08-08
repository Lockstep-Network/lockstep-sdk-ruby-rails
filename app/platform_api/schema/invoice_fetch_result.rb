class Schema::InvoiceFetchResult < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  
  # @type: integer
  # @format: int32
  field :total_count

  
  # @type: integer
  # @format: int32
  field :page_size

  
  # @type: integer
  # @format: int32
  field :page_number

  #  For more information on Invoices, see [InvoiceModel](https://developer.lockstep.io/reference/get_api-v1-invoices-id).
  # @type: array
  field :records
  
end
