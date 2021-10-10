FactoryBot.define do
  factory :post do
    title { Faker::Lorem.words(number: 3).join("\s") }
    content { Faker::Lorem.paragraph }
    association :creator, factory: :user
  end
end
