module Afterpay
  module Components
    class Contact < Base
      # @attribute name
      # @return [String]
      # Full name of contact. Maximum length is 255 characters.
      attr_accessor :name

      # @attribute line1
      # @return [String]
      # Street address. Maximum length is 128 characters.
      attr_accessor :line1

      # @attribute line2
      # @return [String]
      # Second line of the address. Maximum length is 128 characters.
      attr_accessor :line2

      # @attribute suburb
      # @return [String]
      # City or suburb name. Maximum length is 128 characters.
      attr_accessor :suburb

      # @attribute state
      # @return [String]
      # State. Maximum length is 128 characters.
      attr_accessor :state

      # @attribute postcode
      # @return [String]
      # The postal code, which is the zip code or equivalent. Maximum length is 128 characters.
      attr_accessor :postcode

      # @attribute country_code
      # @return [String]
      # The two-character ISO 3166-1 country code.
      attr_accessor :country_code

      # @attribute phone_number
      # @return [String]
      # The phone number, in E.123 format. Maximum length is 32 characters.
      attr_accessor :phone_number
    end
  end
end
