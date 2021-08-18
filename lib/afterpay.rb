# frozen_string_literal: true

require 'afterpay/api/base'
require 'afterpay/api/configuration'
require 'afterpay/api/configuration/retrieve'
require 'afterpay/api/order'
require 'afterpay/api/order/create'
require 'afterpay/api/payment'
require 'afterpay/api/payment/capture'
require 'afterpay/api/payment/refund'
require 'afterpay/api/payment/auth'
require 'afterpay/api/payment/void'
require 'afterpay/api/payment/deferred_capture'
require 'afterpay/components/base'
require 'afterpay/components/consumer'
require 'afterpay/components/contact'
require 'afterpay/components/discount'
require 'afterpay/components/item'
require 'afterpay/components/merchant'
require 'afterpay/components/money'
require 'afterpay/components/order'
require 'afterpay/components/payment_event'
require 'afterpay/components/payment'
require 'afterpay/components/refund'
require 'afterpay/components/courier'

module Afterpay
  class << self
    # @!attribute merchant_id
    # @return [String] Afterpay merchant ID that is used for authorization
    attr_accessor :merchant_id

    # @!attribute secret_key
    # @return [String] Afterpay secret key that is used for authorization
    attr_accessor :secret_key

    # @!attribute server
    attr_writer :server

    # @yield [self] to accept configuration settings
    def configure
      yield self
    end

    # @return [Hash] current Afterpay configuration
    def configuration
      {
        merchant_id: @merchant_id,
        secret_key: @secret_key
      }
    end

    # @return [String] Afterpay server to which requests sended
    def server
      @server || DEFAULT_SERVER
    end
  end

  DEFAULT_SERVER = 'https://api.us.afterpay.com/'
end
