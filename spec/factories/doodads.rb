FactoryBot.define do
  factory :doodad do
    name { Faker::Lorem.words(number: [*1..5].sample) }
    description { Faker::Lorem.paragraphs(number: [*1..5].sample) }
  end
end
