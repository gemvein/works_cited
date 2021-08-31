module WorksCited
  class Contributor < ApplicationRecord
    belongs_to :works_cited_citation, inverse_of: :works_cited_contributor
  end
end
