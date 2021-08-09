FactoryBot.define do
  factory :courier, class: Afterpay::Components::Courier do
    priority   { 'STANDARD' }

    name       { Faker::Lorem.word }
    tracking   { Faker::Number.number(10) }
    shipped_at { Faker::Time.between(DateTime.now - 1, DateTime.now) }
  end
end
