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
    end
  end
end
