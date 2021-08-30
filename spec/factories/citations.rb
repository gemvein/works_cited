FactoryBot.define do
  factory :citation do
    type { 'book' }
    media { 'print' }
    record { Doodad.first }
    title { Faker::Book.title }
    publisher { Faker::Book.publisher }
    city { Faker::Address.city }
    edition { nil }
    volume { nil }
    series { nil }
    year { [*1..100].years.ago.year }
  end
end
