module WorksCited
  # Application Helper
  module ApplicationHelper
    def works_cited_list(record)
      render 'works_cited/citations/list', record: record
    end

    def works_cited_citation(citation)
      render "works_cited/citation_types/#{citation.citation_type}", citation: citation
    end
  end
end
