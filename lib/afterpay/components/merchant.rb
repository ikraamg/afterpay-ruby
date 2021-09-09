# frozen_string_literal: true

module Afterpay
  module Components
    class Merchant < Base
      # @attribute redirect_confirm_url
      # @return [String]
      # The user is redirected to this URL on confirmation.
      attr_accessor :redirect_confirm_url

      # @attribute redirect_cancel_url
      # @return [String]
      # The user to redirected to this URL if the payment process is cancelled.
      attr_accessor :redirect_cancel_url

      # @attribute popup_origin_url
      # @return [String]
      # URL to receive Javascript callbacks from Afterpay (e.g. onComplete, onShippingAddressChange, etc).
      # Include the scheme, hostname and port. Port is optional.
      attr_accessor :popup_origin_url
    end
  end
end
