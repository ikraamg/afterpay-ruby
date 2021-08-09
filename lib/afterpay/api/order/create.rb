module Afterpay
  module API
    module Order
      class Create < Base
        def initialize(params = {})
          @order = params[:order]
        end

        private

        attr_reader :order

        def payload
          {
            action:   :post,
            body:     order.as_json,
            endpoint: endpoint
          }
        end

        def endpoint; URL; end
      end
    end
  end
end
