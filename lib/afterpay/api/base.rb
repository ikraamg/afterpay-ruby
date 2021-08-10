# frozen_string_literal: true

require 'afterpay/callable'
require 'afterpay/error_handler'
require 'afterpay/http_service'
require 'afterpay/http_service/request'
require 'afterpay/http_service/response'

module Afterpay
  module API
    class Base < Callable
      def call
        ::Afterpay::ErrorHandler.inspect(response)
      end

      private

      def response
        @response ||= ::Afterpay::HTTPService::Response.new(
          status: raw_response.status.to_i,
          body: raw_response.body,
          headers: raw_response.headers
        )
      end

      def raw_response
        @raw_response ||= request.perform(payload)
      end

      def request
        @request ||= ::Afterpay::HTTPService::Request.new(
          ::Afterpay::HTTPService.configuration
        )
      end
    end
  end
end
