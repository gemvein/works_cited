# frozen_string_literal: true

module WorksCited
  # Application Helper
  module ApplicationHelper
    def works_cited_list(record, title = 'Works Cited')
      citations = record.works_cited_citations.accessible_by(current_ability, :list)
      render 'works_cited/citations/list', citations: citations, title: title
    end

    def works_cited_citation(citation)
      path_to_partial = "works_cited/citation_types/#{citation.citation_type}"
      partial_exists = lookup_context.find_all(path_to_partial, [], true).any?

      if partial_exists
        render path_to_partial, citation: citation
      else
        render 'works_cited/citation_types/default', citation: citation
      end
    end

    def works_cited_citation_fields(form, citation_type)
      path_to_partial = "works_cited/citation_types/#{citation_type}_fields"
      partial_exists = lookup_context.find_all(path_to_partial, [], true).any?
      path_to_partial = 'works_cited/citation_types/default_fields' unless partial_exists
      render path_to_partial, f: form, citation_type: citation_type
    end
  end
end
