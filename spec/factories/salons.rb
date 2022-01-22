FactoryBot.define do
  factory :random_salon, class: 'Salon' do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    phone { '+375 29 123-45-67' }
    email { Faker::Internet.email }
    notes { Faker::Lorem.paragraph }
    owner_id { rand(1..100) }
  end

  trait(:nil_owner_id) { owner_id { nil } }
  trait(:nil_address) { address { nil } }
end
