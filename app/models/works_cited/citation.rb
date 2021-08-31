# frozen_string_literal: true

module WorksCited
  class Citation < ApplicationRecord
    validates_presence_of :citation_type, :record
    belongs_to :record, polymorphic: true
    has_many :works_cited_contributors, inverse_of: :works_cited_citation, class_name: 'WorksCited::Contributor', foreign_key: :works_cited_citation_id
    accepts_nested_attributes_for :works_cited_contributors
  end
end
