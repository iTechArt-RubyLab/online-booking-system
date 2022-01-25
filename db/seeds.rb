require 'faker'

50.times do
  Salon.create!(
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    phone: '+375 44 299-99-99',
    email: Faker::Internet.email,
    notes: Faker::Lorem.paragraph,
    owner_id: rand(1..100)
  )
end

puts 'Salons have been created'

50.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    middle_name: Faker::Name.middle_name,
    salon_id: rand(1...101),
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

Service.create(
  category: :body_care,
  salon_id: 1, 
  name: 'asdfasf', 
  description: 'afdasfasdasgd', 
  hidden_price: 1,
  availability: 1
)

puts 'Services has been created'

50.times do
  Visit.create(start_at: Date.current, end_at: Date.current, price: rand(1..100), address: Faker::Address.full_address,
               status: 0)
end

puts 'Visits have been created'
