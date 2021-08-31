# frozen_string_literal: true

FactoryBot.define do
  factory :works_cited_contributor, class: WorksCited::Contributor do
    contributor_role { %i[author editor compiler translator].sample }
    first { Faker::Name.first_name }
    middle { [true, false].sample ? Faker::Name.middle_name : '' }
    last { Faker::Name.last_name }
    suffix { [true, false].sample ? Faker::Name.suffix : '' }
    works_cited_citation { nil }
  end
end
