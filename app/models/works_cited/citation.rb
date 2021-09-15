# frozen_string_literal: true

module WorksCited
  # Citation
  class Citation < ApplicationRecord
    # Validations
    validates_presence_of :citation_type, :record, :title
    validates(
      :citation_type,
      inclusion: {
        in: WorksCited.configuration.valid_citation_types,
        allowed_options: WorksCited.configuration.valid_citation_types.to_sentence(
          last_word_connector: ', or '
        )
      }
    )

    # Relationships
    belongs_to :record, polymorphic: true
    has_many :works_cited_contributors, -> { order(:last, :first, :middle, :suffix, :handle) }, inverse_of: :works_cited_citation, class_name: 'WorksCited::Contributor',
             foreign_key: :works_cited_citation_id
    has_many :works_cited_authors, -> { authors.order(:last, :first, :middle, :suffix, :handle) }, inverse_of: :works_cited_citation, class_name: 'WorksCited::Contributor',
             foreign_key: :works_cited_citation_id
    accepts_nested_attributes_for :works_cited_contributors, allow_destroy: true

    # Scopes
    scope :ordered_by_author, (lambda do
      joins(:works_cited_authors)
        .order('MIN(works_cited_contributors.last) ASC, '\
          'MIN(works_cited_contributors.first) ASC, '\
          'MIN(works_cited_contributors.middle) ASC, '\
          'MIN(works_cited_contributors.suffix) ASC, '\
          'MIN(works_cited_contributors.handle) ASC')
        .group(:id)
    end)

    # Dynamic stuff (from configuration)
    # Creates scopes such as .books and methods such as #book?
    WorksCited.configuration.valid_citation_types.each do |given_type|
      scope given_type.pluralize.to_sym, -> { where(citation_type: given_type) }
      define_method("#{given_type}?".to_sym) do
        citation_type == given_type
      end
    end

    # Instance Methods
    def record=(value)
      unless value.is_a? String
        super(value)
        return
      end

      model_name, id = value.split(':')
      return unless model_name.present? && id.present?

      model = model_name.constantize
      super model.find(id)
    end

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

    if defined?(RailsAdmin)
      rails_admin do
        visible false
        edit do
          field :citation_type, :enum do
            enum do
              WorksCited.configuration.valid_citation_types
            end
          end
          field :works_cited_contributors do
            label 'Contributors'
          end
          include_all_fields
          field :media
          field :record do
            # Can't remove this using :inverse_of because it's polymorphic
            visible false
          end
        end
      end
    end
  end
end
