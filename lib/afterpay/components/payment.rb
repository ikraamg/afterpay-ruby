# frozen_string_literal: true

module Afterpay
  module Components
    class Payment < Base
      # @attribute token
      # @return [String]
      # The token returned in the order creation request.
      attr_accessor :token

      # @attribute merchant_reference
      # @return [String]
      # The merchant's order id / reference that this payment corresponds to
      attr_accessor :merchant_reference

      # @attribute amount
      # @return [Afterpay::Components::Money]
      # The refund amount.
      attr_accessor :amount
    end
  end
end
