# frozen_string_literal: true

module WorksCited
  class Citation < ApplicationRecord
    validates_presence_of :type
    belongs_to :record, polymorphic: true
    has_many :works_cited_contributors, inverse_of: :works_cited_citation, class_name: 'WorksCited::Contributor'
  end
end
