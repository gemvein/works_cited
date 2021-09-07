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
    has_many :works_cited_contributors, inverse_of: :works_cited_citation, class_name: 'WorksCited::Contributor',
                                        foreign_key: :works_cited_citation_id
    accepts_nested_attributes_for :works_cited_contributors, allow_destroy: true

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
      return unless model_name.present? and id.present?

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
  end
end
