FactoryBot.define do
  factory :salons_social_network, class: 'SalonsSocialNetwork' do
    link { Faker::Internet.url }
    salon_id { 1 }
    social_network_id { 3 }
  end

  trait(:no_link) { link { nil } }
  trait(:no_social_network_id) { social_network_id { nil } }
end
