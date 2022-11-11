# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'open-uri'
require 'date'

puts "Clearing Database"
Booking.destroy_all
Bar.destroy_all
User.destroy_all

puts "Creating Bar Owner"
user = User.create!(
  name: "Jess",
  email: "jess@test.com",
  password: "123456"
)
puts "Bar owner created"

puts "Creating bars in paris"

bar = Bar.new(
  name: "Experimental Cocktail Club",
  address: "37 Rue Saint-Sauveur",
  description: "Creative cocktails & DJ tunes in a rustic, cozy bar with exposed bricks & wood beams",
  price: rand(100..450),
  user: user)
# file = URI.open('TODO')
# bar.photos.attach(io: file, filename: 'experimental.png', content_type: 'image/jpg')
bar.save!
puts "Bar #{bar.name} created"

bar = Bar.new(
  name: "Little Red Door",
  address: "60 Rue Charlot",
  description: "An array of creative, inventively presented cocktails at an intimate, acclaimed bar",
  price: rand(100..450),
  user: user)
# file = URI.open('TODO')
# bar.photos.attach(io: file, filename: 'littlereddoor.png', content_type: 'image/jpg')
bar.save!
puts "Bar #{bar.name} created"

bar = Bar.new(
  name: "Harry's New York Bar",
  address: "60 Rue Charlot",
  description: "Classic, bespoke & Cuban-style cocktails in a chic, wood-lined space with a piano bar in the cellar",
  price: rand(100..450),
  user: user)
# file = URI.open('TODO')
# bar.photos.attach(io: file, filename: 'harrys.png', content_type: 'image/jpg')
bar.save!
puts "Bar #{bar.name} created"

bar = Bar.new(
  name: "L'Ours Bar",
  address: "8 Rue de Paradis",
  description: "Buzzy, low-lit dive bar with a Polynesian vibe, pouring inventive tropical cocktails",
  price: rand(100..450),
  user: user)
# file = URI.open('TODO')
# bar.photos.attach(io: file, filename: 'lours.png', content_type: 'image/jpg')
bar.save!
puts "Bar #{bar.name} created"

bar = Bar.new(
  name: "Bisou.",
  address: "15 Bd du Temple",
  description: "Snug, eclectic, pink-hued bar offering made-to-order seasonal cocktails & alfresco seating",
  price: rand(100..450),
  user: user)
# file = URI.open('TODO')
# bar.photos.attach(io: file, filename: 'bisou.png', content_type: 'image/jpg')
bar.save!
puts "Bar #{bar.name} created"

bar = Bar.new(
  name: "Lulu White Drinking Club",
  address: "12 Rue Frochot",
  description: "Cool, compact bar for artisanal cocktails, absinthe drinks & frequent live jazz music",
  price: rand(100..450),
  user: user)
# file = URI.open('TODO')
# bar.photos.attach(io: file, filename: 'lulu.png', content_type: 'image/jpg')
bar.save!
puts "Bar #{bar.name} created"

puts "All bars created"
puts "Creating Booking User"
booker = User.create!(
  name: "Sunny",
  email: "sunny@test.com",
  password: "123456"
)
puts "Booker created"

puts "Creating 1 bookings per bar"
Bar.all.each do |bar|
  date = Date.today+rand(30)
  Booking.create!(
    start_date: date,
    end_date: date + 1,
    user: booker,
    bar: bar
  )
end
puts "Bookings created"
