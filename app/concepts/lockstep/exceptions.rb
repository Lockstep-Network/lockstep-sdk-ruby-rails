module Lockstep::Exceptions
  class UnauthorizedError < StandardError; end
  class BadRequestError < StandardError; end
  class RecordNotFound < StandardError; end
end
