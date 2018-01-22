Theme.destroy_all
User.destroy_all

# Themes
themes = []
themes << Theme.create(name: "Modern and Minimal")
themes << Theme.create(name: "Sleek and Sophisticated")
themes << Theme.create(name: "Warm and Cozy")
themes << Theme.create(name: "Room with a View")
themes << Theme.create(name: "Elegant and Ornate")
themes << Theme.create(name: "A Man's Touch")
themes << Theme.create(name: "White Washed")
themes << Theme.create(name: "Tempting Terrace")

# Users
users = []
60.times do
  users << User.create(
      email: Faker::Internet.email,
      password: "abcd1234"
  )
end

rooms = []
users.sample(15).each do |user|
  rooms << Room.create(
      home_type: ["House", "Apartment"].sample,
      room_type: ["Shared", "Private room", "Entire home"].sample,
      accommodate: rand(1..6),
      bedroom_count: rand(1..3),
      bathroom_count: rand(1..2),
      listing_name: Faker::Company.bs,
      description: Faker::Hipster.paragraph,
      address: "#{Faker::Address.street_address} #{Faker::Address.city} (#{Faker::Address.country})",
      has_tv: [true, false].sample,
      has_kitchen: [true, false].sample,
      has_airco: [true, false].sample,
      has_heating: [true, false].sample,
      has_internet: [true, false].sample,
      price: rand(80..150),
      active: true,
      user: user,
      themes: themes.sample(rand(2..4)),
  )
end

User.all.each do |user|
  nights = rand(1..6)
  start_date = Faker::Date.between(3.year.ago, 2.years.from_now)
  end_date = start_date + nights.days

  room = rooms.sample
  Booking.create(
      room: room,
      user: user,
      price: room.price,
      total: room.price * nights,
      starts_at: start_date,
      ends_at: end_date,
      created_at: start_date - (rand(2..9).months)
  )
end

users.sample(15).each do |user|
  rooms << Room.create(
      home_type: ["House", "Appartment"].sample,
      room_type: ["Shared", "Private room", "Entire home"].sample,
      accommodate: rand(1..6),
      bedroom_count: rand(1..3),
      bathroom_count: rand(1..2),
      listing_name: Faker::Hipster.sentence,
      description: Faker::Hipster.paragraph,
      has_tv: [true, false].sample,
      has_kitchen: [true, false].sample,
      has_airco: [true, false].sample,
      has_heating: [true, false].sample,
      has_internet: [true, false].sample,
      price: rand(80..150),
      active: true,
      user: user,
      themes: themes.sample(rand(2..4)),
  )
end
