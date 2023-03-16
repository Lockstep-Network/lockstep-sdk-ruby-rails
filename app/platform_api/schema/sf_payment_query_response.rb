class Schema::SfPaymentQueryResponse < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The total of elements on the response (not in the current page).
  # @type: integer
  # @format: int32
  field :total_elements

  # The total of pages on the response.
  # @type: integer
  # @format: int32
  field :total_pages

  # The size of the current page.
  # @type: integer
  # @format: int32
  field :size

  # The page number between 0 and the totalPages property.
  # @type: integer
  # @format: int32
  field :page_number


  has_many :payments, {:class_name=>"Schema::SfPaymentResponse", :included=>true}

end