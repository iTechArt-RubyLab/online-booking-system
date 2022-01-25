FactoryBot.define do
  factory :salon do
    name { "Salon of #{Faker::Name.name}" }
    address { "Minsk, #{Faker::Address.street_name}" }
    phone { '+375 29 883-26-36' }
    email { Faker::Internet.email }
    notes { 'Notes' }
    owner_id { 0 }
  end
end
