# frozen_string_literal: true

module WorksCited
  class Citation < ApplicationRecord
    # Validations
    validates_presence_of :citation_type, :record, :title
    CitationTypeOptions = %w[book].freeze
    validates(
      :citation_type,
      inclusion: {
        in: CitationTypeOptions,
        allowed_options: CitationTypeOptions.to_sentence(
          last_word_connector: ', or '
        )
      }
    )

    # Relationships
    belongs_to :record, polymorphic: true
    has_many :works_cited_contributors, inverse_of: :works_cited_citation, class_name: 'WorksCited::Contributor', foreign_key: :works_cited_citation_id
    accepts_nested_attributes_for :works_cited_contributors
  end
end
