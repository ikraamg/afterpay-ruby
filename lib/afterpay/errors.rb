# frozen_string_literal: true

module Afterpay
  class BaseError                 < StandardError; end

  class BadRequestError           < BaseError;     end

  class UnathorizedError          < BaseError;     end

  class PaymentRequiredError      < BaseError;     end

  class NotFoundError             < BaseError;     end

  class MethodNotAllowedError     < BaseError;     end

  class NotAcceptableError        < BaseError;     end

  class ConflictError             < BaseError;     end

  class GoneError                 < BaseError;     end

  class PreconditionFailedError   < BaseError;     end

  class UnprocessableEntityError  < BaseError;     end

  class TooManyRequestsError      < BaseError;     end

  class InternalServerError       < BaseError;     end

  class ServiceUnavailableError   < BaseError;     end
end
