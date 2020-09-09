FactoryBot.define do
  factory :user do
    email { "joe@example.com" }
    password { "123456" }
    username { "Joe" }
  end

  factory :random_user do
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
    username { "random" }
  end

  factory :article do
    title { Faker::Hipster.sentence(word_count: 3) }
    content { Faker::Hipster.paragraph }
    date { "2020/3/18" }
    user {create(:random_user)}
  end 
end