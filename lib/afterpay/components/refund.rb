module Afterpay
  module Components
    class Refund < Base
      # @attribute merchant_reference
      # @return [String]
      # The merchant's refund id / reference that this refund corresponds to.
      attr_accessor :merchant_reference

      # @attribute amount
      # @return [Afterpay::Components::Money]
      # The refund amount.
      attr_accessor :amount
    end
  end
end
