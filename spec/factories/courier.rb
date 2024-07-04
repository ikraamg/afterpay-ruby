# frozen_string_literal: true

FactoryBot.define do
  factory :courier, class: Afterpay::Components::Courier do
    priority   { 'STANDARD' }

    name       { Faker::Lorem.word }
    tracking   { Faker::Number.number(digits: 10) }
    shipped_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end
