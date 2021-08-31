module WorksCited
  class Contributor < ApplicationRecord
    belongs_to :works_cited_citation, inverse_of: :works_cited_contributors, class_name: 'WorksCited::Citation'
  end
end
