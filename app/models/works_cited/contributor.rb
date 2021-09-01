# frozen_string_literal: true

module WorksCited
  # Contributor
  class Contributor < ApplicationRecord
    # Validations
    validates_presence_of :works_cited_citation, :contributor_role
    CONTRIBUTOR_ROLE_OPTIONS = %w[author editor compiler translator receiver].freeze
    validates(
      :contributor_role,
      inclusion: {
        in: CONTRIBUTOR_ROLE_OPTIONS,
        allowed_options: CONTRIBUTOR_ROLE_OPTIONS.to_sentence(
          last_word_connector: ', or '
        )
      }
    )

    # Relationships
    belongs_to :works_cited_citation, inverse_of: :works_cited_contributors, class_name: 'WorksCited::Citation',
                                      foreign_key: :works_cited_citation_id

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
        first_contributor_name = first_contributor.full_name(first_contributor.name_order)

        case number_of_contributors
        when 1
          first_contributor_name
        when 2
          "#{first_contributor_name}, and #{second_contributor.full_name(:first)}"
        else
          "#{first_contributor_name}, et al"
        end
      end

      private

      def first_contributor
        all.first
      end

      def second_contributor
        all.offset(1).first
      end

      def number_of_contributors
        all.size
      end
    end

    # Instance Methods
    def name_order
      if contributor_role == 'author'
        :last
      else
        :first
      end
    end

    def full_name(order = :first)
      order = :first if handle.present?
      parts = if order == :last
                name_parts_reversed
              else
                name_parts
              end
      name_string = parts.compact.join(' ')

      return name_string unless handle.present?

      "#{handle} [#{name_string}]"
    end

    def name_parts
      parts = []
      parts << first_name_or_initial
      parts << middle_initial
      parts << if suffix.present? && last.present?
                 "#{last}, #{suffix}"
               else
                 suffix.presence || last.presence
               end
      parts
    end

    def name_parts_reversed
      parts = []
      parts << "#{last}," if last.present?
      parts << first_name_or_initial
      parts << if suffix.present? && middle_initial.present?
                 "#{middle_initial}, #{suffix}"
               else
                 suffix.presence || middle_initial
               end
      parts
    end

    def first_name_or_initial
      return nil unless first.present?

      first.length == 1 ? "#{first}." : first
    end

    def middle_initial
      return nil unless middle.present?

      middle[0, 1]&.upcase
    end
  end
end
