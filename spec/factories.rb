FactoryBot.define do
  factory :user do
    email { "joe@example.com" }
    password { "123456" }
    username { "Joe" }
  end

  factory :article do
    title { "A title" }
    content { "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Risus in hendrerit gravida rutrum quisque non tellus orci. Urna condimentum mattis pellentesque id nibh tortor id aliquet." }
    publish_at { "2020/7/24" }
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
    punlish_at { "2020/3/18" }
    user {create(:random_user)}
  end 
end