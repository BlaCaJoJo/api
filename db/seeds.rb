# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
20.times do
  Member.create!(name: Faker::Name.first_name,
      email: Faker::Internet.email,
      password: "password")
end

30.times do
  Question.create!(title: Faker::Lorem.sentence,
      desc: Faker::Lorem.paragraph,
      member_id: rand(1...20))
end


30.times do
  Answer.create!(question_id: rand(1...30),
    member_id: rand(1...20),
    desc: Faker::Lorem.paragraph,
    accepted: false)
end

table = ["Answer", "Question"]

100.times do
  Vote.create!(member_id: rand(1...20),
    up_down: rand(2),
    vote_for_id: rand(1...30),
    vote_for_type: table[rand(2)])
end
