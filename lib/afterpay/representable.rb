require 'json'

module Afterpay
  module Representable
    def self.included(base)
      base.extend         Forwardable
      base.def_delegators :as_json, :to_json
    end

    def as_json
      instance_values.reduce({}) do |mem, (key, value)|
        mem.merge!(camelize(key) => represent(value))
      end
    end

    private

    def camelize(value)
      value.gsub(/_(\w)/) { Regexp.last_match(1).upcase }
    end

    def represent(value)
      non_primitive?(value) ? value.as_json : value
    end

    def non_primitive?(value)
      value.is_a? Afterpay::Components::Base
    end

    def instance_values
      Hash[
        instance_variables.map do |name|
          [
            name.to_s[1..-1],
            instance_variable_get(name)
          ]
        end
      ]
    end
  end
end
