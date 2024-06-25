# frozen_string_literal: true

FactoryBot.define do
  factory :money, class: Afterpay::Components::Money do
    amount   { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    currency { Faker::Currency.code }
  end
end
