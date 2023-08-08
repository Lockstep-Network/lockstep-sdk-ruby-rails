# frozen_string_literal: true

module SageNetwork::Exceptions
  class UnauthorizedError < StandardError; end
  class BadRequestError < StandardError; end
  class RecordNotFound < StandardError; end
end
