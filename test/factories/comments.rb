FactoryBot.define do
  factory :comment do
    post
    association :creator, factor: :user
  end
end
