FactoryBot.define do
  factory :refund, class: Afterpay::Components::Refund do
    merchant_reference { Faker::Lorem.characters(5) }
    amount             { build(:money)  }
  end
end
