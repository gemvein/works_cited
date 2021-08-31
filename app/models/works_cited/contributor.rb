module WorksCited
  class Contributor < ApplicationRecord
    # Validations
    validates_presence_of :works_cited_citation, :contributor_role

    # Relationships
    belongs_to :works_cited_citation, inverse_of: :works_cited_contributors, class_name: 'WorksCited::Citation', foreign_key: :works_cited_citation_id

    # Scopes
    scope :authors, -> { where(contributor_role: 'author') }
    scope :editors, -> { where(contributor_role: 'editor') }
    scope :compilers, -> { where(contributor_role: 'compiler') }
    scope :translators, -> { where(contributor_role: 'translator') }

    # Class Methods
    class << self
      def list_names
        all.map do |contributor|
          order = if contributor.first? && contributor.contributor_role == 'author'
                    :last
                  else
                    :first
                  end
          contributor.full_name(order)
        end.to_sentence
      end
    end

    # Instance Methods
    def full_name(order = :first)
      first_name_or_initial = first.length == 1 ? "#{first}." : first
      middle_initial = middle[0, 1]&.upcase

      if order == :last
        parts = [
          "#{last},",
          first_name_or_initial
        ]
        if suffix.present? && middle_initial.present?
          parts << "#{middle_initial}, #{suffix}"
        elsif suffix.present?
          parts << suffix
        elsif middle_initial.present?
          parts << middle_initial
        end
      else
        parts = [
          first_name_or_initial,
          middle_initial
        ]
        if suffix.present? && last.present?
          parts << "#{last}, #{suffix}"
        elsif suffix.present?
          parts << suffix
        elsif last.present?
          parts << last
        end
      end
      parts.join(' ')
    end
  end
end