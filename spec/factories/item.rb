# frozen_string_literal: true

FactoryBot.define do
  factory :item, class: Afterpay::Components::Item do
    name     { Faker::Lorem.word }
    sku      { Faker::Lorem.characters(number: 5) }
    quantity { Faker::Number.between(from: 1, to: 25) }
    price    { build(:money) }
  end
end
