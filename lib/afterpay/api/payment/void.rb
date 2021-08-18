# frozen_string_literal: true

module Afterpay
  module API
    module Payment
      class Void < Base
        def initialize(params = {})
          @order_id = params[:order_id]
          @payment = params[:payment]
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
          "#{URL}/#{order_id}/void"
        end
      end
    end
  end
end
