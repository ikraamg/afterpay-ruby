# frozen_string_literal: true

module Afterpay
  module API
    module Payment
      class Reversal < Base
        def initialize(params = {})
          @token = params[:token]
        end

        private

        attr_reader :token

        def payload
          {
            action: :post,
            endpoint: endpoint
          }
        end

        def endpoint
          "#{URL}/token:#{token}/reversal"
        end
      end
    end
  end
end
