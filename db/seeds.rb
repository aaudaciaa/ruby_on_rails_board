# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Faker::Config.locale = 'ko'

User.create([
  {
    email: "asdf@asdf.com",
    password: "asdf"
  },
  {
    email: "qwer@qwer.com",
    password: "qwer"
  },
  {
    email: "zxcv@zxcv.com",
    password: "zxcv"
  }
])

100.times do
  Post.create(
    title: Faker::Address.state,
    content: Faker::Lorem.words,
    user_id: rand(1..3) # (1..3).to_a.sample(1)로 해도 된다.
  )
end

200.times do
  Comment.create(
    content: Faker::Movie.quote,
    post_id: rand(1..5),
    user_id: rand(1..3)
  )
end
