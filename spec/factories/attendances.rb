FactoryBot.define do
  factory :attendance do
    stripe_customer_id { "MyString" }
    user_id { User.last.id }
    event_id { Event.last.id }
  end
end
