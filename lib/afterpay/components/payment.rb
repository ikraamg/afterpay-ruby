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

      # @attribute is_checkout_adjusted
      # @return [Boolean]
      # Whether there have been changes to the order since the initial order creation.
      attr_accessor :is_checkout_adjusted

      # @attribute payment_schedule_checksum
      # @return [String]
      # A unique value representing the payment schedule that must be provided
      # when there has been changes since the initial order creation.
      attr_accessor :payment_schedule_checksum

      # @attribute items
      # @return [Array<Afterpay::Components::Item>]
      # An array of order items that have been updated to be provided
      # if it has changed since the initial order creation.
      attr_accessor :items

      # @attribute shipping
      # @return [Afterpay::Components::Contact]
      # The shipping address for this order to be provided if it has changed since the initial order creation.
      attr_accessor :shipping
    end
  end
end
