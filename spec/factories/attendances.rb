FactoryBot.define do
  factory :attendance do
    stripe_customer_id { "MyString" }
    user_id { User.all.sample.id }
    event_id { Event.all.sample.id }
  end
end
