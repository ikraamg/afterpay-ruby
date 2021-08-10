# frozen_string_literal: true

module Afterpay
  module Components
    class Discount < Base
      # @attribute display_name
      # @return [String]
      # A display name for the discount.
      attr_accessor :display_name

      # @attribute amount
      # @return [Afterpay::Components::Money]
      # The discount amount.
      attr_accessor :amount
    end
  end
end
