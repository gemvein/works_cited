# frozen_string_literal: true

FactoryBot.define do
  factory :works_cited_contributor, class: WorksCited::Contributor do
    contributor_role { 'author' }
    first { 'print' }
    middle { Doodad.first }
    last { Faker::Book.title }
    suffix { Faker::Book.publisher }
    works_cited_citation { nil }
  end
end
