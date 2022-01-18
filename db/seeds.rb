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
