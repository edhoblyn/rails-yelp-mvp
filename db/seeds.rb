# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
require "faker"

puts "Cleaning database..."
Review.destroy_all
Restaurant.destroy_all

puts "Creating restaurants..."

categories = [ "chinese", "italian", "japanese", "french", "belgian" ]

10.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: categories.sample
  )
end

puts "Created #{Restaurant.count} restaurants"

puts "Creating reviews..."

Restaurant.all.each do |restaurant|
  rand(2..5).times do
    Review.create!(
      content: Faker::Restaurant.review,
      rating: rand(0..5),
      restaurant: restaurant
    )
  end
end

puts "Created #{Review.count} reviews"
