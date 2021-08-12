# frozen_string_literal: true

FactoryBot.define do
  factory :discount, class: Afterpay::Components::Discount do
    display_name { Faker::Lorem.word }
    amount       { build(:money) }
  end
end
