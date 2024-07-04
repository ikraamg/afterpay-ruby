# frozen_string_literal: true

FactoryBot.define do
  factory :payment, class: Afterpay::Components::Payment do
    merchant_reference { Faker::Lorem.characters(number: 5) }
    token              { Faker::Lorem.characters(number: 15) }
  end
end
