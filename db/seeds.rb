puts "cleaning up database"
Flat.destroy_all
puts'database is clean'

puts 'Creating flats'
3.times do
  flat = Flat.create(
  name: Faker::Name.name,
  address: Faker::Address.street_address,
  description: Faker::Hipster.sentence(word_count: 3),
  price_per_night: rand(50..100),
  number_of_guests: rand(2..7)
  )
  puts "flat #{flat.id} is created"
end

puts "done"
