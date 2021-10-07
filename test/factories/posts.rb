FactoryBot.define do
  factory :post do
    title { Faker::Lorem.words number: 3 }
    association :creator, factory: :user
  end
end
