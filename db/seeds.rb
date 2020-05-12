# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
User.destroy_all
Event.destroy_all
Attendance.destroy_all

users = []
events = []

30.times do |i|
    users << User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        description: Faker::Lorem.paragraphs,
        encrypted_password: "test"
    )

    puts "#{i + 1}/30 utilisateurs créés"
end

10.times do |i|
    events << Event.create!(
        #start_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
        start_date: Time.parse("2020-08-12")
        duration: 5 * rand(1..100),
        title: Faker::Lorem.words,
        description: Faker::Lorem.paragraphs,
        price: rand(1..999),
        location: cities.sample,
    )

    puts "#{i + 1}/10 évènements créés"
end

10.times do |i|
    attendance = Attendance.create!(
        user: users.sample,
        event: events.sample
    )

    puts "#{i + 1}/10 participations créés"