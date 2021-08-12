# frozen_string_literal: true

require 'afterpay/errors'

module Afterpay
  module ErrorHandler
    class << self
      # Returns a response if request was successful, raises an error otherwise
      # @param [Afterpay::HTTPService::Response] response
      # @return [Afterpay::HTTPService::Response] if request was successful
      def inspect(response)
        return response if response.ok?

        raise ERRORS[response.status], response_message(response)
      end

      def response_message(response)
        response.body.is_a?(String) ? JSON.parse(response.body)['message'] : response.message
      end

      ERRORS = {
        400 => BadRequestError,
        401 => UnathorizedError,
        402 => PaymentRequiredError,
        404 => NotFoundError,
        405 => MethodNotAllowedError,
        406 => NotAcceptableError,
        409 => ConflictError,
        410 => GoneError,
        412 => PreconditionFailedError,
        422 => UnprocessableEntityError,
        429 => TooManyRequestsError,
        500 => InternalServerError,
        503 => ServiceUnavailableError
      }.freeze
    end
  end
end
