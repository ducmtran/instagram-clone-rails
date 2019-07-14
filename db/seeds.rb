# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'populator'
require 'faker'
User.populate 15 do |user|
  user.email = Faker::Internet.email
  user.encrypted_password = Faker::Lorem.word
  Profile.populate 1 do |profile|
    profile.user_id = user.id
    profile.handle = Faker::TvShows::GameOfThrones.character.remove(" ").underscore
    profile.bio = Faker::TvShows::GameOfThrones.quote
    profile.name = Faker::TvShows::GameOfThrones.character
  end
  Post.populate 1..5 do |post|
    post.user_id = user.id
    post.caption = Faker::Quote.most_interesting_man_in_the_world
  end
end