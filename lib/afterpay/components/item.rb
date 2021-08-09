module Afterpay
  module Components
    class Item < Base
      # @attribute name
      # @return [String]
      # Product's name
      attr_accessor :name

      # @attribute sku
      # @return [String]
      # Product's SKU
      attr_accessor :sku

      # @attribute quantity
      # @return [Integer]
      # The quantity of the item.
      attr_accessor :quantity

      # @attribute price
      # @return [Afterpay::Components::Money]
      # The unit price of the individual item. Must be a positive value.
      attr_accessor :price
    end
  end
end
