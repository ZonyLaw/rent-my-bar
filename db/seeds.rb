# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

 puts "Clean user database"

 User.destroy_all

 puts "Add a list of users"
 5.times do
   user = User.new(
     name: Faker::Name.name,
     email: Faker::Internet.email,
     password: "123456")
   user.save!

  puts "User #{user.name} created"
end
puts "Populated user database"

puts "Clean bar database"
Bar.destroy_all

puts "Add a list of bars"
20.times do
  bar = Bar.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    description: "Beer selection: #{rand(5..30)}, Amenities: #{rand(20..50)} tables, #{rand(0..3)} pool tables, #{rand(0..3)} darts,
      Food: #{['French', 'Italian', 'English', 'Turkish', 'American'].sample}.
      Lorem ipsum dolor sit amet. Aut voluptas perspiciatis id
      voluptatibus error non placeat voluptatem ut reprehenderit deserunt
      et magnam accusantium in sunt eligendi. Eos rerum earum hic veritatis
      illum aut accusantium voluptatibus aut quia quisquam eos quasi esse.
      Non unde quam 33 quaerat quia ut voluptate provident id laudantium autem!",
    price: [100, 150,250,300,350,400].sample,
    user: User.all.sample)
  bar.save!

  puts "Bar #{bar.name} created"
end
puts "Populated bar database"
