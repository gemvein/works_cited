# frozen_string_literal: true

module WorksCited
  # Application Helper
  module ApplicationHelper
    def works_cited_list(record, title = 'Works Cited')
      citations = record.works_cited_citations.accessible_by(current_ability, :list)
      render 'works_cited/citations/list', citations: citations, title: title
    end

    def works_cited_citation(citation)
      path = partial_path_or_default('citation', citation.citation_type)
      render path, citation: citation, contributors: citation.works_cited_contributors
    end

    def works_cited_preview(citation, contributors)
      path = partial_path_or_default('citation', citation.citation_type)
      render path, citation: citation, contributors: contributors
    end

    def works_cited_citation_fields(form, citation_type)
      path = partial_path_or_default('fields', citation_type)
      render path, f: form, citation_type: citation_type
    end

    def list_names(names)
      first = first_contributor(names)
      first_contributor_name = first&.full_name(first.name_order)
      case number_of_contributors(names)
      when 0 then nil
      when 1 then first_contributor_name
      when 2
        "#{first_contributor_name}, and #{second_contributor(names).full_name(:first)}"
      else
        "#{first_contributor_name}, et al"
      end
    end

    private

    def partial_path_or_default(purpose, citation_type)
      unless WorksCited.configuration.valid_citation_types.include? citation_type
        raise 'Invalid Citation Type sent to partial_path_or_default'
      end

      path_to_partial = "works_cited/citation_types/#{purpose}/#{citation_type}"
      partial_exists = lookup_context.find_all(path_to_partial, [], true).any?

      return path_to_partial if partial_exists

      "works_cited/citation_types/#{purpose}/default"
    end

    def first_contributor(names)
      names.first
    end

    def second_contributor(names)
      names.offset(1).first
    end

    def number_of_contributors(names)
      names.size
    end
  end
end
