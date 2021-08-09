module Afterpay
  module Components
    class Order < Base
      # @attribute total_amount
      # @return [Afterpay::Components::Money]
      # Total amount for order to be charged to consumer.
      attr_accessor :total_amount

      # @attribute consumer
      # @return [Afterpay::Components::Consumer]
      # The consumer requesting the order.
      attr_accessor :consumer

      # @attribute billing
      # @return [Afterpay::Components::Contact]
      # Billing address.
      attr_accessor :billing

      # @attribute shipping
      # @return [Afterpay::Components::Contact]
      # Shipping address.
      attr_accessor :shipping

      # @attribute courier
      # @return [Afterpay::Components::Courier]
      # Shipping Courier details.
      attr_accessor :courier

      # @attribute description
      # @return [String]
      # A description of the order.
      attr_accessor :description

      # @attribute items
      # @return [Array<Afterpay::Components::Item>]
      # An array of order items.
      attr_accessor :items

      # @attribute discounts
      # @return [Array<Afterpay::Components::Discount>]
      # An array of discounts.
      attr_accessor :discounts

      # @attribute merchant
      # @return [Afterpay::Components::Merchant]
      # Merchant's redirection links..
      attr_accessor :merchant

      # @attribute payment_type
      # @return [String]
      # Supported payment types: 'PAY_BY_INSTALLMENT'. Default is 'PAY_BY_INSTALLMENT'.
      attr_accessor :payment_type

      # @attribute merchant_reference
      # @return [String]
      # The merchant's id / reference that this order corresponds to.
      attr_accessor :merchant_reference

      # @attribute tax_amount
      # @return [Afterpay::Components::Money]
      # The included tax amount after applying all discounts.
      attr_accessor :tax_amount

      # @attribute shipping_amount
      # @return [Afterpay::Components::Money]
      # The shipping amount.
      attr_accessor :shipping_amount
    end
  end
end
