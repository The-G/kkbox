# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |row|
  Member.create(
    msno: Faker::Name.name_with_middle,
    city: rand(1..5),
    bd: rand(1..10),
    gender: ["m","f"].sample(1),
    registered_via: rand(1..6),
    registration_init_time: Faker::Date.birthday(18, 65)
  )
end

# t.string :msno
# t.string :city
# t.integer :bd
# t.string :gender
# t.integer :registered_via
# t.date :registration_init_time
