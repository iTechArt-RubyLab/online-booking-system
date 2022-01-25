FactoryBot.define do
  factory :random_service, class: 'Service' do
    salon_id { rand(1..10) }
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    duration { rand(1..180) }
    price { rand(1..100) }
    hidden_price { rand(1..100) }
    availability { rand(0..1) }
  end

  trait(:no_salon_id) { salon_id { nil } }
  trait(:no_name) { name { nil } }
  trait(:no_description) { description { nil } }
  trait(:no_duration) { duration { nil } }
  trait(:no_price) { price { nil } }
  trait(:no_hidden_price) { hidden_price { nil } }
  trait(:no_availability) { availability { nil } }
end
