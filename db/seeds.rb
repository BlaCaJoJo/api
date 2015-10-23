# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  Member.create!(name: Faker::Name.first_name,
      email: Faker::Name.last_name,
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

table = ["Answer", "Question"]

10.times do
  Vote.create!(member_id: rand(10),
    up_down: rand(2),
    vote_for_id: rand(10),
    vote_for_type: table[rand(2)])
end
