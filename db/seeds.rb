# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  Member.create!(name: Faker::Name.first_name,
      email: Faker::Internet.email,
      password: "password")
end

10.times do
  Question.create!(title: Faker::Lorem.sentence,
      desc: Faker::Lorem.paragraph,
      member_id: rand(10))
end

10.times do
  Answer.create!(question_id: rand(10),
    member_id: rand(10),
    desc: Faker::Lorem.paragraph,
    accepted: false)
end

id_gen = []
10.times do
  id_gen << rand(2)
end

vote_gen = []
10.times do
  vote_gen << rand(2)
end

10.times do
  Votes.create!(member_id: rand(10),
    answer_id: rand(10) ? rand(2) == 0 : question_id: rand(10),
    up: true ? rand(2) == 0 : down: true)
end
