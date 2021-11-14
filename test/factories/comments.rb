FactoryBot.define do
  factory :comment do
    post
    name { Faker::Name.name }
    email { Faker::Internet.email }
    association :creator, factor: :user
  end
end
