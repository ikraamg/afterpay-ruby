# frozen_string_literal: true

require 'afterpay/initializable'
require 'afterpay/representable'

module Afterpay
  module Components
    # @note This class is used as parent class for all other Afterpay models
    class Base
      include Representable
      include Initializable
    end
  end
end
