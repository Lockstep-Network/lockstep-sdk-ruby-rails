module Lockstep::Exceptions
  class UnauthorizedError < StandardError; end
  class BadRequestError < StandardError; end
  class RecordNotFound < StandardError; end
  class ApiResponseError < StandardError; end
end
