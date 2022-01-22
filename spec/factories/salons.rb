FactoryBot.define do
  factory :random_salon do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    phone { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
    notes { Faker::Lorem.paragraph }
    owner_id { rand(1..100) }
  end
end
