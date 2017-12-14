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
    gender: ["male","female"].sample(1)[0],
    registered_via: rand(1..6),
    registration_init_time: Faker::Time.backward(720).strftime("%Y-%m-%d")
  )
end

1000.times do |row|
  Transaction.create(
  msno: Member.find((1..Member.count).to_a.sample(1)[0]).msno,
  payment: rand(1..5)*1000,
  payment_plan_days: [10,20,30,60].sample(1),
  plan_list_price: rand(1..5)*1000,
  actual_amount_paid: rand(1..5)*1000,
  is_auto_renew: rand(0..1),
  transaction_date:  Faker::Time.backward(720).strftime("%Y-%m-%d"),
  membership_expire_date:  Faker::Time.backward(720).strftime("%Y-%m-%d"),
  is_cancel: rand(0..1),
)
end

200.times do |row|
  Churn.create(
        date: Faker::Time.backward(720).strftime("%Y-%m-%d"),
        msno: Member.find((1..Member.count).to_a.sample(1)[0]).msno,
        predict: rand(0..1),
        actual: rand(0..1)
      )
end
# 10.times do |row|
#   Comment.create(
#     name: Faker::Name.name,
#     comment: Faker::HowIMetYourMother.quote
# )
# end
