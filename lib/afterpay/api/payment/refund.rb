module Afterpay
  module API
    module Payment
      class Refund < Base
        def initialize(params = {})
          @order_id = params[:order_id]
          @refund   = params[:refund]
        end

        private

        attr_reader :refund, :order_id

        def payload
          {
            action:   :post,
            body:     refund.as_json,
            endpoint: endpoint
          }
        end

        def endpoint
          "#{URL}/#{order_id}/refund"
        end
      end
    end
  end
end
