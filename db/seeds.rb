# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

ben = User.create!(
  email: "ben.s-a@hotmail.com",
  user_name: "Ben",
  password: "123456"
  )
User.create!(
  email: "alex.s-a@hotmail.com",
  user_name: "Alex",
  password: "123456"
  )

Game.create!(
    name: 'GTA',
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    genre: 'Action-adventure',
    location: 'London',
    platform: 'XBox One',
    price: 5,
    remote_photo_url: "https://cdn.images.dailystar.co.uk/dynamic/184/photos/553000/620x/GTA-5-online-630659.jpg",
    user_id: 1
)
Game.create!(
    name: 'Diablo 3',
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    genre: 'Role-Playing Game',
    location: 'Machester',
    platform: 'PC',
    price: 7,
    remote_photo_url: "http://www.dlcompare.com:8042/upload/cache/game_tetiere/img/diablo-3-reaper-of-souls-img-4.jpg",
    user_id: 1
)
Game.create!(
    name: 'FIFA',
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    genre: 'Sport',
    location: 'Birmingham',
    platform: 'PS4',
    price: 10,
    remote_photo_url: "https://media.contentapi.ea.com/content/dam/ea/easports/fifa/ultimate-team/campaigns/2018/home-page-toty/fifa18-homepage-topterhero-bg-xs.jpg",
    user_id: 1
)
Game.create!(
    name: 'FIFA',
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    genre: 'Sport',
    location: 'Leeds',
    platform: 'PS4',
    price: 8,
    remote_photo_url: "https://media.contentapi.ea.com/content/dam/ea/easports/fifa/ultimate-team/campaigns/2018/home-page-toty/fifa18-homepage-topterhero-bg-xs.jpg",
    user_id: 1
)

puts "seeding complete"
