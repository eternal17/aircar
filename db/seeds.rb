# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Car.destroy_all
User.destroy_all

50.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

50.times do
  Car.create!(
    make: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    user: User.all.sample,
    price: rand(25..50),
    year: rand(1995..2020),
    description: Faker::Quote.famous_last_words,
    address: Faker::Address.state
  )
end
