# frozen_string_literal: true

module WorksCited
  # Concern to allow strong parameters when using accepts_nested_attributes_for to edit Cookbook Uses
  module Params
    extend ActiveSupport::Concern

    included do
      # rescue_from Pundit::NotAuthorizedError, with: :authorization_error
      # include Pundit
    end

    def works_cited_params
      {
        works_cited_citations_attributes: [
          :id, :citation_type, :title, :container_title, :publisher, :city, :edition, :volume,
          :number, :series, :year, :record, :media, :url, :pages, :published_at, :online_database, :doi,
          :accessed_at, :_destroy,
          { works_cited_contributors_attributes: %i[id contributor_role first middle last suffix handle _destroy] }
        ]
      }
    end
  end
end
