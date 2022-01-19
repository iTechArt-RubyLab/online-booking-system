#Add salons

100.times do |t|
  solon = Salon.create!(
    name: "Salon name #{t}",
    address: "Minsk, street #{rand(1...101)}",
    phone: '+375 29 883-26-36',
    email: "example#{t}@example.com",
    notes: 'Notes',
    links: ['example.com', 'test.com']
  )
end

puts 'Salons have been created'

100.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    patronymic: Faker::Name.middle_name,
    salon_id: rand(1...101),
    email: Faker::Internet.email,
    work_email: Faker::Internet.email,
    phone: '+375 25 609-99-99',
    work_phone: '+375 25 609-99-99',
    birthday: Faker::Date.between(from: 50.years.ago, to: Date.today),
    role: rand(0...2),
    status: rand(0...4),
    notes: Faker::Lorem.paragraph
  )
end