FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
  end

  factory :setting do
    new_user_key { "abcd"}
  end

  factory :driver do
    email { Faker::Internet.unique.email }
  end

  factory :pickup do
    email { Faker::Internet.unique.email }
    name { Faker::Name.name }
    street_address { Faker::Address.street_address }
  end
end
