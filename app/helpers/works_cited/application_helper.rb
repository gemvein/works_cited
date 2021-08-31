module WorksCited
  module ApplicationHelper
    def works_cited_list(record)
      render 'works_cited/citations/list', record: record
    end

    def works_cited_citation(citation)
      case citation.citation_type
      when 'book'
        render 'works_cited/citation_types/book', citation: citation
      else
        "Could not load citation. Unknown citation type: #{citation.citation_type}"
      end
    end
  end
end
