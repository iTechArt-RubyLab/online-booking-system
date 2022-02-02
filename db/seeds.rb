require 'faker'

['Body Care', 'Hair Care', 'Face Care', 'Makeup', 'Nails', 'Massage', 'Spa', 'Other'].each do |el|
  FactoryBot.create(:category, name: el)
end
puts 'Catigories have been created'

# creats salon_owners with salons(with service and professional)
5.times do
  FactoryBot.create(:salon_owner)
  puts "Salon owner created"
end

FactoryBot.create_list(:client, 5)
puts "Clients created"

Salon.all.each do |salon|
  2.times do    
    user_id = salon.professionals.map(&:id).sample
    client_id = Client.pluck(:id).sample
    service_id = salon.services.map(&:id).sample

    FactoryBot.create(:visit, user_id: user_id, client_id: client_id, service_id: service_id)
  end
end


20.times do
  FactoryBot.create(:social_network)
  puts "Created social_network with id: #{SocialNetwork.last.id}"
end

10.times do
  salon_id = Salon.pluck(:id).sample
  FactoryBot.create(:salons_social_network, salon_id: salon_id, social_network_id: rand(1..20))
  puts "Created salons_social_network with id: #{SalonsSocialNetwork.last.id}"
end