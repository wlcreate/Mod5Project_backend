# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Reflection.destroy_all
Place.destroy_all
Trip.destroy_all
Category.destroy_all
User.destroy_all

Reflection.reset_pk_sequence
Place.reset_pk_sequence
Trip.reset_pk_sequence
Category.reset_pk_sequence
User.reset_pk_sequence

## Users
waverley = User.create!(first_name: "Waverley", last_name: "Leung", username: "wavey", password: "abc123")

## Categories
bar = Category.create!(name: "Bar")
cafe = Category.create!(name: "Cafe")
restaurant = Category.create!(name: "Restaurant")
cultural_center = Category.create!(name: "Cultural Center")
shopping = Category.create!(name: "Shopping")
park = Category.create!(name: "Park")
museum = Category.create!(name: "Museum")
zoo = Category.create!(name: "Zoo")

## Trips
summer_2018 = Trip.create!(title: "Summer Vacation 2018", description: "Trip with the fam to get away from NYC and go to a nice beach", start_date: DateTime.new(2018, 8, 15), end_date: DateTime.new(2018, 8, 22), user: waverley)

## Places
crabcake_factory = Place.create!(name: "The Original Crabcake Factory", address: "12000 Coastal Hwy, Ocean City, MD 21842", area: "Ocean City", country: "USA", revisit: true, category: restaurant, trip: summer_2018)
horizons = Place.create!(name: "Horizons Oceanfront Restaurant", address: "10100 Coastal Hwy, Ocean City, MD 21842", area: "Ocean City", country: "USA", revisit: true, category: restaurant, trip: summer_2018)
abbey_burger_bistro = Place.create!(name: "The Abbey Burger Bistro", address: "12601 Coastal Hwy, Ocean City, MD 21842", area: "Ocean City", country: "USA", revisit: false, category: restaurant, trip: summer_2018)
tanger_rehoboth_beach = Place.create!(name: "Tanger Outlets Rehoboth Beach", address: "36470 Seaside Outlet Dr, Rehoboth Beach, DE 19971", area: "Rehoboth Beach", country: "USA", revisit: true, category: shopping, trip: summer_2018)

## Reflections
crabcake_factory_reflection = Reflection.create!(place: crabcake_factory, date_visited: DateTime.new(2018, 8, 15), rating: 8, content: "When we first arrived after driving for the whole day we went here. There was a 15 minute wait not too bad, and not much of a waiting area, but the crabcakes were delicious~")

puts "🛫🛫🛫🛫🛫🛫"