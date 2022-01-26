require 'faker'

FactoryBot.create(:salon_owner)
FactoryBot.create(:client)
FactoryBot.create(:visit, client_id: Client.last.id, salon_id: Salon.last.id)

50.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    middle_name: Faker::Name.middle_name,
    email: Faker::Internet.email,
    work_email: Faker::Internet.email,
    phone: '+375 25 609-99-99',
    work_phone: '+375 33 200-11-11',
    birthday: Faker::Date.between(from: 50.years.ago, to: Date.today - 18.years),
    role: rand(0...2),
    rating: 0,
    status: rand(0...4),
    notes: Faker::Lorem.paragraph,
    image_url: 'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&f=y'
  )
end

puts 'Users have been created'

puts 'Visits have been created'
