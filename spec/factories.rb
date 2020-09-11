FactoryBot.define do
  factory :user do
    email { "joe@example.com" }
    password { "123456" }
    username { "Joe" }
  end

  factory :article do
    title { "A title" }
    content { "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Risus in hendrerit gravida rutrum quisque non tellus orci. Urna condimentum mattis pellentesque id nibh tortor id aliquet." }
    date { "2020/7/24" }
    is_published { true }
    user { build(:user) }
  end

  factory :random_user do
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
    username { "random" }
  end

  factory :random_article do
    title { Faker::Hipster.sentence(word_count: 4) }
    content { Faker::Hipster.paragraph }
    date { "2020/3/18" }
    is_published { true }
    user {create(:random_user)}
  end 
end