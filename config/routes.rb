# frozen_string_literal: true

WorksCited::Engine.routes.draw do
  patch 'preview', to: 'citations#preview', as: 'preview_citation'
  resources :citations
end
