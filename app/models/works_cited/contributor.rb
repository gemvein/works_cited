# frozen_string_literal: true

module WorksCited
  # Contributor
  class Contributor < ApplicationRecord
    # Validations
    validates_presence_of :works_cited_citation, :contributor_role
    validates(
      :contributor_role,
      inclusion: {
        in: WorksCited.configuration.valid_contributor_roles,
        allowed_options: WorksCited.configuration.valid_contributor_roles.to_sentence(
          last_word_connector: ', or '
        )
      }
    )

    # Relationships
    belongs_to :works_cited_citation, inverse_of: :works_cited_contributors, class_name: 'WorksCited::Citation',
                                      foreign_key: :works_cited_citation_id

    # Scopes
    default_scope { order(last: :asc) }

    # Dynamic stuff (from configuration)
    # Creates scopes such as .authors and methods such as #author?
    WorksCited.configuration.valid_contributor_roles.each do |given_role|
      scope given_role.pluralize.to_sym, -> { where(contributor_role: given_role) }
      define_method("#{given_role}?".to_sym) do
        contributor_role == given_role
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
      parts << first_name_or_initial.presence
      parts << middle_initial.presence
      parts << [last.presence, suffix.presence].compact.join(', ').presence
      parts
    end

    def name_parts_reversed
      parts = []
      parts << [last.presence, name_other_parts.presence].compact.join(', ').presence
      parts
    end

    def name_other_parts
      other_parts = []
      other_parts << first_name_or_initial.presence
      other_parts << [middle_initial.presence, suffix.presence].compact.join(', ').presence
      other_parts.compact.join(' ').presence
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
