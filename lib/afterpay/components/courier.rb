# frozen_string_literal: true

module Afterpay
  module Components
    class Courier < Base
      # @attribute shipped_at
      # @return [String]
      # The time at which the order was shipped (ISO 8601 UTC/Zulu time).
      attr_accessor :shipped_at

      # @attribute name
      # @return [String]
      # The name of the courier.
      attr_accessor :name

      # @attribute tracking
      # @return [String]
      # The tracking number provided by the courier.
      attr_accessor :tracking

      # @attribute priority
      # @return [String]
      # The shipping priority. If provided, must be either 'STANDARD' or 'EXPRESS'.
      attr_accessor :priority
    end
  end
end
