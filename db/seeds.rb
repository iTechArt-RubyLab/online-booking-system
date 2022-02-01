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

Category.create(name: 'Body Care', image_url: 'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&f=y' )
Category.create(name: 'Hair Care', image_url:  'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&f=y' )
Category.create(name: 'Face Care', image_url:  'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&f=y' )
Category.create(name: 'Makeup', image_url:  'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&f=y' )
Category.create(name: 'Nails', image_url:  'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&f=y' )
Category.create(name: 'Massage', image_url:  'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&f=y' )
Category.create(name: 'Spa', image_url:  'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&f=y' )
Category.create(name: 'Other', image_url:  'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&f=y' )

puts 'Catigories have been created'

20.times do
  FactoryBot.create(:service, salon_id: rand(1..10))
  puts "Created service with id: #{Service.last.id}"
end

25.times do
  FactoryBot.create(:visit, user_id: rand(1..5), client_id: rand(1..10), service_id: rand(1..20))
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