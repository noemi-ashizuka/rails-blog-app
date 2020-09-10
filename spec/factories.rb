FactoryBot.define do
  factory :user do
    email { "joe@example.com" }
    password { "123456" }
    username { "Joe" }
  end

  factory :article do
    title { "A title" }
    content { "Something in here" }
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
    title { Faker::Hipster.sentence(word_count: 3) }
    content { Faker::Hipster.paragraph }
    date { "2020/3/18" }
    is_published { true }
    user {create(:random_user)}
  end 
end