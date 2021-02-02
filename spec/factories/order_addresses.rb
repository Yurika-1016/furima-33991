FactoryBot.define do
  factory :order_address do
    postal_code {Faker::Number.number(digits:7).to_s.insert(3, "-")}
    prefecture_id  {Faker::Number.between(from: 1, to: 47)}
    city {Faker::Address.city}
    address {Faker::Address.street_address}
    building {Faker::Address.secondary_address}
    phone_number {Faker::Number.number(digits: 11)}
    token {Faker::Lorem.characters(number: 33)}
  end
end
