FactoryBot.define do
  factory :role do
    name { Faker::Lorem.word }
  end

  factory :admin_role, parent: :role do
    name { 'administrator' }
  end
end
