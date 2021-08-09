FactoryBot.define do
  factory :item, class: Afterpay::Components::Item do
    name     { Faker::Lorem.word }
    sku      { Faker::Lorem.characters(5) }
    quantity { Faker::Number.between(1, 25) }
    price    { build(:money) }
  end
end
