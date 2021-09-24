# frozen_string_literal: true

module WorksCited
  module Mixins
    # HasWorksCited Mixin
    module HasWorksCited
      extend ActiveSupport::Concern

      # rubocop:disable Naming/PredicateName
      def has_works_cited(_options = {})
        extend ClassMethods
        include InstanceMethods

        has_many :works_cited_citations, as: :record, class_name: 'WorksCited::Citation'
        accepts_nested_attributes_for :works_cited_citations, reject_if: :all_blank, allow_destroy: true
      end
      # rubocop:enable Naming/PredicateName

      # Extended by has_works_cited mixin
      module ClassMethods
      end

      # Included by has_works_cited mixin
      module InstanceMethods
        def works_cited_citations_attributes=(raw_citations)
          array = []
          raw_citations&.each do |_index, citation|
            destroy = citation.delete(:_destroy)
            if destroy == '1'
              if citation[:id]
                old = Citation.find(citation[:id])
                old.destroy
              end
              next
            end

            array << citation
          end
          super array
        end
      end
    end
  end
end
