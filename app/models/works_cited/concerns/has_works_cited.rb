# frozen_string_literal: true

module WorksCited
  module Concerns
    module Models
      module HasWorksCited
        extend ActiveSupport::Concern

        # 'included do' causes the included code to be evaluated in the
        # context where it is included (article.rb), rather than being
        # executed in the module's context (works_cited/concerns/models/has_works_cited).
        included do
          has_many :works_cited_citations, as: :record, class_name: 'WorksCited::Citation'
        end
      end
    end
  end
end
