FactoryBot.define do
  factory :event do
    start_date { "2019-02-11 16:05:49" }
    duration { 5 }
    title { "MyString" }
    description { "MyText" }
    price { 1 }
    location { "MyString" }
    user_id { User.last.id }
  end
end
