Flat.delete_all if Rails.env.development?

10.times do
  Flat.create({
    name: Faker::TvShows::GameOfThrones.house,
    address: Faker::Address.full_address,
    description: Faker::TvShows::GameOfThrones.quote,
    price_per_night: rand(200..1000),
    number_of_guests: rand(2..10),
    img: Faker::LoremFlickr.image
  })
end

puts "Created #{Flat.count} flats"
