# frozen_string_literal: true

module WorksCited
  module Mixins
    # HasWorksCited Mixin
    module HasWorksCited
      extend ActiveSupport::Concern

      def has_works_cited(options = {})
        extend ClassMethods
        include InstanceMethods

        has_many :works_cited_citations, as: :record, class_name: 'WorksCited::Citation'
      end

      # Extended by has_works_cited mixin
      module ClassMethods

      end

      # Included by has_works_cited mixin
      module InstanceMethods

      end
    end
  end
end