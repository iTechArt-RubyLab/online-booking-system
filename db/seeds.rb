require 'faker'

# FactoryBot.create(:salon_owner)
# FactoryBot.create(:visit, client_id: Client.last.id, salon_id: Salon.last.id)

10.times { FactoryBot.create(:client) }
puts '10 clients created'
FactoryBot.create(:user)
puts  'user created'
FactoryBot.create(:salon_owner)
10.times { FactoryBot.create(:service, salon_id: Salon.last.id) }
puts '10 services created'

50.times do
  Visit.create(start_at: Date.current, end_at: Date.current, price: rand(1..100), address: Faker::Address.full_address,
               status: 0)
end

puts 'Visit has been created'

10.times do
  SocialNetwork.create(
    name: Faker::Lorem.word
)
end

puts 'SocialNetwork has been created'

10.times do
  SalonsSocialNetwork.create(
    salon_id: rand(1...51),
    social_network_id: rand(1...11),
    link: Faker::Internet.url
)
end

puts 'SalonSocialNetwork has been created'
