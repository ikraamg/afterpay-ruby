# frozen_string_literal: true

FactoryBot.define do
  factory :consumer, class: Afterpay::Components::Consumer do
    phone_number { Faker::PhoneNumber.cell_phone }
    given_names  { Faker::Name.first_name }
    surname      { Faker::Name.last_name }
    email        { Faker::Internet.email }
  end
end
