FactoryBot.define do
  factory :outfit do
    title { Faker::Lorem.word }
    created_by { Faker::Number.number(10) }
  end
end
