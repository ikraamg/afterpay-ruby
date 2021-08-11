module Afterpay
  module Components
    class Refund < Base
      # @attribute request_id
      # @return [String]
      # A unique request ID, required for safe retries. It is recommended that the merchant generate a UUID for each
      # unique refund.
      attr_accessor :request_id

      # @attribute merchant_reference
      # @return [String]
      # The merchant's refund id / reference that this refund corresponds to.
      attr_accessor :merchant_reference

      # @attribute refund_merchant_reference
      # @return [String]
      # A unique reference for the individual refund event. If provided, the value will appear in the daily settlement
      # file as "Payment Event ID". Limited to 128 characters.
      attr_accessor :refund_merchant_reference

      # @attribute amount
      # @return [Afterpay::Components::Money]
      # The refund amount.
      attr_accessor :amount
    end
  end
end
