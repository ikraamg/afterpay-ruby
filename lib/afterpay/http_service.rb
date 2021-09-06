# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'

module Afterpay
  module HTTPService
    class << self
      # @return [Hash] default HTTPService configuration
      def configuration
        {
          middleware: DEFAULT_MIDDLEWARE,
          server: ::Afterpay.server
        }
      end
    end

    # Afterpay default middleware stack
    DEFAULT_MIDDLEWARE = proc do |builder|
      builder.request    :json
      builder.request    :basic_auth, *::Afterpay.configuration.values

      builder.response   :mashify
      builder.response   :json, content_type: /\bjson$/

      builder.adapter    Faraday.default_adapter
    end
  end
end
