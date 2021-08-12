# frozen_string_literal: true

FactoryBot.define do
  factory :merchant, class: Afterpay::Components::Merchant do
    redirect_confirm_url { Faker::Internet.url }
    redirect_cancel_url  { Faker::Internet.url }
  end
end
