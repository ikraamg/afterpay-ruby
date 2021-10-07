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

        raise ERRORS[response.status].new(response_error_code(response)), response_message(response)
      end

      def response_message(response)
        response.body.is_a?(String) ? JSON.parse(response.body)['message'] : response.message
      end

      def response_error_code(response)
        response.body.is_a?(String) ? JSON.parse(response.body)['errorCode'] : response.body.errorCode
      end

      ERRORS = {
        400 => BadRequestError,
        401 => UnathorizedError,
        402 => PaymentRequiredError,
        404 => NotFoundError,
        405 => MethodNotAllowedError,
        406 => NotAcceptableError,
        408 => RequestTimeoutError,
        409 => ConflictError,
        410 => GoneError,
        412 => PreconditionFailedError,
        422 => UnprocessableEntityError,
        429 => TooManyRequestsError,
        500 => InternalServerError,
        503 => ServiceUnavailableError,
        504 => GatewayTimeoutError
      }.freeze
    end
  end
end
