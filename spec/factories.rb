FactoryBot.define do
  factory :user do
    email { "joe@example.com" }
    password { "123456" }
  end

  factory :random_user do
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
  end
end