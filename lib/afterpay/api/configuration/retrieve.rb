module Afterpay
  module API
    module Configuration
      class Retrieve < Base
        private

        def payload
          {
            action:   :get,
            endpoint: endpoint
          }
        end

        def endpoint; URL; end
      end
    end
  end
end
