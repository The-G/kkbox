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
    gender: ["m","f"].sample(1)[0],
    registered_via: rand(1..6),
    registration_init_time: Faker::Date.birthday(18, 65)
  )
end

100.times do |row|
  Transaction.create(
  msno: Faker::Name.name_with_middle,
  payment: rand(1..5)*1000,
  payment_plan_days: [10,20,30,60].sample(1),
  plan_list_price: rand(1..5)*1000,
  actual_amount_paid: rand(1..5)*1000,
  is_auto_renew: rand(0..1),
  transaction_date:  Faker::Date.birthday(1, 10).month,
  membership_expire_date:  Faker::Date.birthday(1, 5).month,
  is_cancel: rand(0..1)
)
end

10.times do |row|
  Comment.create(
    name: Faker::Name.name,
    comment: Faker::HowIMetYourMother.quote
)
end


# t.string :name
# t.string :comment

# t.string :msno
# t.string :city
# t.integer :bd
# t.string :gender
# t.integer :registered_via
# t.date :registration_init_time

#
# t.string :msno,
# t.integer, :payment
# t.integer, :payment_plan_days
# t.integer, :plan_list_price
# t.integer, :actual_amount_paid
# t.integer, :is_auto_renew
# t.date, :transaction_date
# t.date, :membership_expire_date
# t.integer :is_cancel
