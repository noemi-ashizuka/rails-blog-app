require 'date'

Article.destroy_all
User.destroy_all

puts "Creating Users, please wait..."

users = []

joe = User.create!(
  username: "Joe",
  email: "joe@example.com",
  password: "123456"
)

sarah = User.create!(
  username: "Sarah",
  email: "sarah@example.com",
  password: "123456"
)

10.times do
  users << User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end


puts "Users created!"

puts "creating articles, please wait..."

12.times do
  Article.create!(
    title: Faker::Hipster.sentence,
    content: Faker::Hipster.paragraph(sentence_count: 15),
    date: Faker::Date.between(from: '2016-09-10', to: '2020-09-09'),
    is_published: [true, false].sample,
    user: joe
)
end

12.times do
  Article.create!(
    title: Faker::Hipster.sentence,
    content: Faker::Hipster.paragraph(sentence_count: 15),
    date: Faker::Date.between(from: '2016-09-10', to: '2020-09-09'),
    is_published: [true, false].sample,
    user: sarah
  )
end

16.times do
  Article.create!(
    title: Faker::Hipster.sentence,
    content: Faker::Hipster.paragraph(sentence_count: 15),
    date: Faker::Date.between(from: '2016-09-10', to: '2020-09-09'),
    is_published: true,
    user: users.sample
  )
end

puts "Articles created!"
