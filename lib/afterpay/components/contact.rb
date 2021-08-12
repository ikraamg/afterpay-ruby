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

      # @attribute area1
      # @return [String]
      # City or suburb. Maximum length is 128 characters.
      attr_accessor :area1

      # @attribute area2
      # @return [String]
      # Suburb or village or local area. Maximum length is 128 characters.
      attr_accessor :area2

      # @attribute region
      # @return [String]
      # Region or state name. Maximum length is 128 characters.
      attr_accessor :region

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
