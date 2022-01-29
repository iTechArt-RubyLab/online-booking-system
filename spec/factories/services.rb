# == Schema Information
#
# Table name: services
#
#  id           :bigint           not null, primary key
#  category     :integer          default("body_care"), not null
#  salon_id     :integer          not null
#  name         :string           not null
#  description  :text             not null
#  duration     :integer          default(1), not null
#  price        :integer          default(1), not null
#  hidden_price :integer
#  availability :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :service, class: 'Service' do
    salon_id { create(:salon).id }
    name { Faker::Superhero.name }
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
