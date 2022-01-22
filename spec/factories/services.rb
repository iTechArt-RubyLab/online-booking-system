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

  trait(:nil_salon_id) { salon_id { nil } }
  trait(:nil_name) { name { nil } }
  trait(:nil_description) { description { nil } }
  trait(:nil_duration) { duration { nil } }
  trait(:nil_hidden_price) { hidden_price { nil } }
  trait(:nil_availability) { availability { nil } }
end
