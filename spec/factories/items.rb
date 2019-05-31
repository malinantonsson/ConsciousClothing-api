FactoryBot.define do
  factory :item do
    name { Faker::Movies::StarWars.character }
  end
end
