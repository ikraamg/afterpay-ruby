# frozen_string_literal: true

module Afterpay
  module Components
    class PaymentEvent < Base
      # @attribute created
      # @return [String]
      # The payment event creation time (ISO 8601 UTC/Zulu time).
      attr_accessor :created

      # @attribute type
      # @return [String]
      # The payment event type of {'AUTHORISE', 'CAPTURE', 'VOID'}
      attr_accessor :type
    end
  end
end
