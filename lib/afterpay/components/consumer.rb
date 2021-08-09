module Afterpay
  module Components
    class Consumer < Base
      # @attribute phone_number
      # @return [String]
      # The consumer's phone number.
      attr_accessor :phone_number

      # @attribute given_names
      # @return [String]
      # The consumer's given names.
      attr_accessor :given_names

      # @attribute surname
      # @return [String]
      # The consumer's surname.
      attr_accessor :surname

      # @attribute email
      # @return [String]
      # The consumer's email.
      attr_accessor :email
    end
  end
end
