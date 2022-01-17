#Add salons

100.times do |t|
  solon = Salon.create!(
    name: "Salon name #{t}",
    address: "Minsk, street #{rand(1...101)}"
  )
end

puts 'Salons have been created'
