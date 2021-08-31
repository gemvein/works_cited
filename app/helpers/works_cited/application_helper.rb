module WorksCited
  module ApplicationHelper
    def works_cited_list(record)
      render 'works_cited/list', record: record
    end
  end
end
