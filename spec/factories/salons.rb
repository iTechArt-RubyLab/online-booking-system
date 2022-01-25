FactoryBot.define do
  factory :salon, class: 'Salon' do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    phone { '+375 29 123-45-67' }
    email { Faker::Internet.email }
    notes { Faker::Lorem.paragraph }
  end

  trait(:no_owner_id) { salon_owner_id { nil } }
  trait(:no_address) { address { nil } }
end
