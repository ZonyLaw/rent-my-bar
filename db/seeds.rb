# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Clean user database"
puts "Add a list of users"
5.times do
  user =User.new(
  name: Faker::Name.name,
  email: Faker::Internet.email)
  user.save!

    puts "User #{user.name} created"
end
puts "Populated bar database"

puts "Clean bar database"
Bar.destroy_all

puts "Add a list of bars"
5.times do
  bar =Bar.new(
  name: Faker::Restaurant.name,
  address: Faker::Address.street_address,
  description: "",
  price: [100, 150,250,300,350,400].sample,
  user: User.find(rand(1..5)))
  bar.save!

  puts "Bar #{bar.name} created"
end
puts "Populated bar database"
