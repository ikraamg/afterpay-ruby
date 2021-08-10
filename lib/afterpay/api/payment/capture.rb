# frozen_string_literal: true

module Afterpay
  module API
    module Payment
      class Capture < Base
        def initialize(params = {})
          @payment = params[:payment]
        end

        private

        attr_reader :payment

        def payload
          {
            action: :post,
            body: payment.as_json,
            endpoint: endpoint
          }
        end

        def endpoint
          "#{URL}/capture"
        end
      end
    end
  end
end
