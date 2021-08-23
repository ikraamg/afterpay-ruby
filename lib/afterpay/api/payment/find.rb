# frozen_string_literal: true

module Afterpay
  module API
    module Payment
      class Find < Base
        def initialize(params = {})
          @order_id = params[:order_id]
        end

        private

        attr_reader :order_id

        def payload
          {
            action: :get,
            endpoint: endpoint
          }
        end

        def endpoint
          "#{URL}/#{order_id}"
        end
      end
    end
  end
end
