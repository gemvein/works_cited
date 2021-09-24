# frozen_string_literal: true

WorksCited::Engine.routes.draw do
  resources :citations do
    member do
      post 'preview', defaults: { format: :json }
    end
    collection do
      post 'preview', defaults: { format: :json }
    end
  end
end
