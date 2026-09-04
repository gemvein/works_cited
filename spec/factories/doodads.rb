# frozen_string_literal: true

FactoryBot.define do
  factory :doodad do
    name { Faker::Lorem.words(number: [*1..5].sample).join(' ').titleize }
    description { Faker::Lorem.paragraphs(number: [*1..5].sample).join("\n") }
  end
end
