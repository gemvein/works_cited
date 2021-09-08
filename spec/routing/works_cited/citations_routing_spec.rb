# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WorksCited::CitationsController, type: :routing do
  routes { WorksCited::Engine.routes }

  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/citations').to route_to('works_cited/citations#index')
    end

    it 'routes to #preview' do
      expect(patch: '/preview').to route_to('works_cited/citations#preview')
    end

    it 'routes to #new' do
      expect(get: '/citations/new').to route_to('works_cited/citations#new')
    end

    it 'routes to #show' do
      expect(get: '/citations/1').to route_to('works_cited/citations#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/citations/1/edit').to route_to('works_cited/citations#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/citations').to route_to('works_cited/citations#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/citations/1').to route_to('works_cited/citations#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/citations/1').to route_to('works_cited/citations#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/citations/1').to route_to('works_cited/citations#destroy', id: '1')
    end
  end
end
