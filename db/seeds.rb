# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

# User.destroy_all

url = 'https://source.unsplash.com/collection/829192/1920x1080'

counter = 1
10.times do
  u = User.create!(
    email: Faker::Internet.email,
    password: 'password',
    user_name: Faker::Internet.user_name

  )

  game = Game.new(
  name: Faker::Pokemon.name,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,
  sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  genre: Faker::Book.genre,
  location: Faker::GameOfThrones.city,
  platform: ["PS4", "XB1", "Steam"].sample,
  price: (1..6).to_a.sample,
  )

  game.remote_photo_url = url
  game.user = u
  game.save
  sleep(1)

  puts "created user number #{counter}"
  counter += 1
end

