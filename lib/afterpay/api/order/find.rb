# frozen_string_literal: true

module Afterpay
  module API
    module Order
      class Find < Base
        def initialize(params = {})
          @token = params[:token]
        end

        private

        attr_reader :token

        def payload
          {
            action: :get,
            endpoint: endpoint
          }
        end

        def endpoint
          "#{URL}/#{token}"
        end
      end
    end
  end
end
