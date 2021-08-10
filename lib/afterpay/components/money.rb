# frozen_string_literal: true

module Afterpay
  module Components
    class Money < Base
      # @attribute amount
      # @return [String]
      # The amount should be a string representation of a decimal number, rounded to 2 decimal places.
      attr_accessor :amount

      # @attribute currency
      # @return [String]
      # The currency is a ISO 4217 format value. Currently only USD is supported.
      attr_accessor :currency
    end
  end
end
