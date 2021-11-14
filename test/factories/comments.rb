FactoryBot.define do
  factory :comment do
    post
    name { Faker::Name.name }
    email { Faker::Internet.email }
    content { Faker::Lorem.paragraph }
    association :creator, factor: :user
  end
end
