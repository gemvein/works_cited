module WorksCited
  class Contributor < ApplicationRecord
    validates_presence_of :works_cited_citation, :contributor_role
    belongs_to :works_cited_citation, inverse_of: :works_cited_contributors, class_name: 'WorksCited::Citation', foreign_key: :works_cited_citation_id
  end
end
