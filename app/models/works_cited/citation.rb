# frozen_string_literal: true

module WorksCited
  # Citation
  class Citation < ApplicationRecord
    # Validations
    validates_presence_of :citation_type, :record, :title
    CITATION_TYPE_OPTIONS = %w[book periodical electronic interview email tweet].freeze
    validates(
      :citation_type,
      inclusion: {
        in: CITATION_TYPE_OPTIONS,
        allowed_options: CITATION_TYPE_OPTIONS.to_sentence(
          last_word_connector: ', or '
        )
      }
    )

    # Relationships
    belongs_to :record, polymorphic: true
    has_many :works_cited_contributors, inverse_of: :works_cited_citation, class_name: 'WorksCited::Contributor',
                                        foreign_key: :works_cited_citation_id
    accepts_nested_attributes_for :works_cited_contributors

    # Instance Methods
    def periodical?
      citation_type == 'periodical'
    end

    def electronic?
      citation_type == 'electronic'
    end

    def book?
      citation_type == 'book'
    end

    def interview?
      citation_type == 'interview'
    end

    def email?
      citation_type == 'email'
    end
  end
end
