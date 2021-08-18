# frozen_string_literal: true

module Afterpay
  module API
    module Payment
      class DeferredCapture < Base
        def initialize(params = {})
          @payment = params[:payment]
          @order_id = params[:order_id]
        end

        private

        attr_reader :payment, :order_id

        def payload
          {
            action: :post,
            body: payment.as_json,
            endpoint: endpoint
          }
        end

        def endpoint
          "#{URL}/#{order_id}/capture"
        end
      end
    end
  end
end
