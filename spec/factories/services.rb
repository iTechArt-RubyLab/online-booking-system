# == Schema Information
#
# Table name: services
#
#  id           :bigint           not null, primary key
#  salon_id     :integer          not null
#  name         :string           not null
#  description  :text             not null
#  duration     :integer          default(1), not null
#  price        :integer          default(1), not null
#  availability :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :bigint           not null
#
FactoryBot.define do
  factory :service, class: 'Service' do
    salon_id { association(:salon).id }
    name { Faker::Superhero.name }
    description { Faker::Lorem.sentence }
    duration { rand(1..180) }
    price { rand(1..100) }
    availability { rand(0..1) }
    category_id { association(:category).id }
  end

  trait(:no_salon_id) { salon_id { nil } }
  trait(:no_name) { name { nil } }
  trait(:no_description) { description { nil } }
  trait(:no_duration) { duration { nil } }
  trait(:no_price) { price { nil } }
  trait(:no_availability) { availability { nil } }
end
