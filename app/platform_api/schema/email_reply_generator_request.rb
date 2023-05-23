class Schema::EmailReplyGeneratorRequest < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The date associated with the email
  # @type: string
  # @format: date-time
  field :date, Types::Params::DateTime

  # The body associated with the email
  # @type: string
  field :body

  # The subject associated with the email
  # @type: string
  field :subject



end