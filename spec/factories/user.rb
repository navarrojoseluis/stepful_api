FactoryBot.define do
  factory :user do
    name { Faker::App.name }
    type { 'Coach' }

    trait :coach do
      type { 'Coach' }
    end

    trait :student do
      type { 'Student' }
    end
  end
end
