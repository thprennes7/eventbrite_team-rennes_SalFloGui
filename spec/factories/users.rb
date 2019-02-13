FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "MyString" }
    description { "MyText" }
    first_name { "MyString" }
    last_name { "MyString" }
  end
end
