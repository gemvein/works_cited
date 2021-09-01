# frozen_string_literal: true

FactoryBot.define do
  factory :works_cited_citation, class: WorksCited::Citation do
    citation_type { %w[book periodical electronic interview].sample }
    media { 'print' }
    record { Doodad.first }
    title { Faker::Book.title }
    container_title { Faker::Book.title }
    publisher { Faker::Book.publisher }
    city { Faker::Address.city }
    edition { nil }
    volume { nil }
    series { nil }
    year { [*1..100].sample.years.ago.year }
    url { Faker::Internet.url }
    published_at { 1.year.ago }
    accessed_at { 1.month.ago }
    pages { '145-6' }
    transient do
      contributors_count { 0 }
    end

    after(:build) do |citation, evaluator|
      citation.works_cited_contributors << build_list(:works_cited_contributor, evaluator.contributors_count,
                                                      works_cited_citation: citation)
    end
  end
end
