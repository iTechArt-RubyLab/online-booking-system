require 'faker'

20.times do
  FactoryBot.create(:salon)
  puts "Salon #{Salon.last.id} created"
end

5.times do
  FactoryBot.create(:salon_owner)
  puts "Salon owner created"
end

5.times do
  FactoryBot.create(:user)
  puts "User created"
end

10.times do
  FactoryBot.create(:client)
  puts "Client created"
end

20.times do
  FactoryBot.create(:service, salon_id: rand(1..10))
  puts "Created service with id: #{Service.last.id}"
end

25.times do
  FactoryBot.create(:visit, client_id: rand(1..10), salon_id: rand(1..10))
end

FactoryBot.create(:service, salon_id: 1)

20.times do
  FactoryBot.create(:social_network)
  puts "Created social_network with id: #{SocialNetwork.last.id}"
end

10.times do
  FactoryBot.create(:salons_social_network, salon_id: rand(1..20), social_network_id: rand(1..20))
  puts "Created salons_social_network with id: #{SalonsSocialNetwork.last.id}"
end