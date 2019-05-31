FactoryBot.define do
  factory :item do
    name { Faker::StarWars.character }
  end
end
