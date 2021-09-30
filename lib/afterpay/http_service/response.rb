# frozen_string_literal: true

module Afterpay
  module HTTPService
    class Response
      extend Forwardable
      # @attribute status
      # @return [Integer] HTTP response status
      attr_reader :status

      # @attribute body
      # @return [Hash] HTTP response body
      attr_reader :body

      # @attribute headers
      # @return [Hash] HTTP response headers
      attr_reader :headers

      def_delegators :body, :message
      # Creates Afterpay::HTTPService::Response instance
      # @param  [Hash] params hash of parameters
      # @return [Afterpay::HTTPService::Response] Response instance
      def initialize(params = {})
        @status  = params[:status]
        @body    = params[:body]
        @headers = params[:headers]
      end

      def ok?
        (200..204).cover?(status.to_i)
      end
    end
  end
end
