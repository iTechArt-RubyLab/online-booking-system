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
    user_id = salon.working_professionals.map(&:id).sample
    client_id = Client.pluck(:id).sample
    service_id = salon.services.map(&:id).sample

    FactoryBot.create(:visit, user_id: user_id, client_id: client_id, service_id: service_id)
  end
end

Salon.all.each do |salon|
  social_network = FactoryBot.create(:social_network)
  FactoryBot.create(:salons_social_network, salon_id: salon.id, social_network_id: social_network.id)
end

puts "Social_networks created"