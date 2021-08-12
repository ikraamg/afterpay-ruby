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

      # @attribute page_url
      # @return [String]
      # The canonical URL for the item's Product Detail Page. Limited to 2048 characters.
      attr_accessor :page_url

      # @attribute image_url
      # @return [String]
      # A URL for a web-optimised photo of the item, suitable for use directly as the src attribute of an img tag. Limited to 2048 characters.
      attr_accessor :image_url

      # @attribute quantity
      # @return [Integer]
      # The quantity of the item.
      attr_accessor :quantity

      # @attribute price
      # @return [Afterpay::Components::Money]
      # The unit price of the individual item. Must be a positive value.
      attr_accessor :price

      # @attribute categories
      # @return [Array]
      # An array of arrays to accommodate multiple categories that apply to the item.
      # Each array represents a hierarchical path to a category, with the left-most category being the top-level parent category.
      attr_accessor :categories

      # @attribute estimated_shipment_date
      # @return [String]
      # The estimated date when the order will be shipped, in YYYY-MM or YYYY-MM-DD format
      attr_accessor :estimated_shipment_date
    end
  end
end
