# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Attendance.destroy_all
#Event.destroy_all
#User.destroy_all

10.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "#{Faker::Lorem.word}@yopmail.com", description: Faker::HitchhikersGuideToTheGalaxy.quote, password: "bonjour")
end

10.times do
  Event.create!(start_date: Faker::Date.forward(50), duration: (5 * rand(1..12)), title: Faker::Cat.name, description: Faker::HitchhikersGuideToTheGalaxy.quote, price: rand(1..1000), location: Faker::Address.city, user_id: User.all.sample.id )
end

10.times do
  Attendance.create!(stripe_customer_id: SecureRandom.urlsafe_base64, user_id: User.all.sample.id, event_id: Event.all.sample.id)
end
