FactoryBot.define do
  factory :post do
    title { Faker::Lorem.words number: 3 }
  end
end