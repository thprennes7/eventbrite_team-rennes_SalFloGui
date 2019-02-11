FactoryBot.define do
  factory :user do
    email { "salflogui@salflogui.com" }
    encrypted_password { "MyString" }
    description { "MyText" }
    first_name { "MyString" }
    last_name { "MyString" }
  end
end
