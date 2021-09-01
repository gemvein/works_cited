module WorksCited
  class Contributor < ApplicationRecord
    # Validations
    validates_presence_of :works_cited_citation, :contributor_role
    ContributorRoleOptions = %w[author editor compiler translator receiver].freeze
    validates(
      :contributor_role,
      inclusion: {
        in: ContributorRoleOptions,
        allowed_options: ContributorRoleOptions.to_sentence(
          last_word_connector: ', or '
        )
      }
    )

    # Relationships
    belongs_to :works_cited_citation, inverse_of: :works_cited_contributors, class_name: 'WorksCited::Citation', foreign_key: :works_cited_citation_id

    # Scopes
    default_scope { order(last: :asc) }
    scope :authors, -> { where(contributor_role: 'author') }
    scope :editors, -> { where(contributor_role: 'editor') }
    scope :compilers, -> { where(contributor_role: 'compiler') }
    scope :translators, -> { where(contributor_role: 'translator') }
    scope :receivers, -> { where(contributor_role: 'receiver') }

    # Class Methods
    class << self
      def list_names
        contributors = all
        number_of_contributors = contributors.size
        first_contributor = contributors.first
        order = if first_contributor.contributor_role == 'author'
                  :last
                else
                  :first
                end

        case number_of_contributors
        when 1
          first_contributor.full_name(order)
        when 2
          second_contributor = contributors.offset(1).first
          "#{first_contributor.full_name(order)}, and #{second_contributor.full_name(:first)}"
        else
          "#{first_contributor.full_name(order)}, et al"
        end
      end
    end

    # Instance Methods
    def full_name(order = :first)
      first_name_or_initial = first.length == 1 ? "#{first}." : first
      middle_initial = middle[0, 1]&.upcase
      parts = []

      order = :first if handle.present?

      if order == :last
        if last.present?
          parts << "#{last},"
        end
        if first_name_or_initial.present?
          parts << first_name_or_initial
        end
        if suffix.present? && middle_initial.present?
          parts << "#{middle_initial}, #{suffix}"
        elsif suffix.present?
          parts << suffix
        elsif middle_initial.present?
          parts << middle_initial
        end
      else
        if first_name_or_initial.present?
          parts << first_name_or_initial
        end
        if middle_initial.present?
          parts << middle_initial
        end
        if suffix.present? && last.present?
          parts << "#{last}, #{suffix}"
        elsif suffix.present?
          parts << suffix
        elsif last.present?
          parts << last
        end
      end

      if handle.present?
        return "#{handle} [#{parts.join(' ')}]"
      end

      parts.join(' ')
    end
  end
end