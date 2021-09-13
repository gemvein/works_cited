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

        has_many :works_cited_citations, as: :record, class_name: 'WorksCited::Citation', inverse_of: :record
        accepts_nested_attributes_for :works_cited_citations, allow_destroy: true
      end
      # rubocop:enable Naming/PredicateName

      # Extended by has_works_cited mixin
      module ClassMethods
      end

      # Included by has_works_cited mixin
      module InstanceMethods
      end
    end
  end
end
