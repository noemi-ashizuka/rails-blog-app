require 'date'

Article.destroy_all
User.destroy_all

puts "creating Users"

joe = User.create!(
  email: "joe@example.com",
  password: "123456"
)

sylvia = User.create!(
  email: "sylvia@example.com",
  password: "123456"
)

puts "Users created"

puts "creating articles"

article_one = Article.create!(
  title: "Article One",
  content: "Quisque at pretium felis. Morbi nec consectetur odio. Integer et vehicula lorem.",
  date: Date.new(2020, 8, 12),
  is_published: true,
  user: joe
)

article_two = Article.create!(
  title: "Article Two",
  content: "Nam commodo ultrices nisl, a dapibus tellus mattis sit amet. Cras tincidunt est a est tempor tristique non at massa.",
  date: Date.new(2020, 6, 19),
  is_published: true,
  user: sylvia
)

article_three = Article.create!(
  title: "Article Three",
  content: "Sed venenatis auctor egestas. Sed tempor eu erat id tincidunt.",
  date: Date.new(2020, 8, 5),
  is_published: false,
  user: sylvia
)

article_four = Article.create!(
  title: "Article Four",
  content: "Quisque vehicula nunc non magna pellentesque mollis. Proin ut congue ipsum, et tempus justo.",
  date: Date.new(2020, 7, 15),
  is_published: false,
  user: joe
)

puts "articles created"
