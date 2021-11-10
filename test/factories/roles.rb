FactoryBot.define do
  factory :role do
    sequence(:name) { |n| "Role #{n}" }
  end

  factory :admin_role, parent: :role do
    name { 'Administrator' }
  end
end
