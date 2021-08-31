module WorksCited
  module WorksCitedHelper
    def works_cited(record)
      render 'works_cited/list', record: record
    end
  end
end
