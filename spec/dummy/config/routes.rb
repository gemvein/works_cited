# frozen_string_literal: true

Rails.application.routes.draw do
  mount WorksCited::Engine => '/works_cited'
  resources :doodads
  root 'doodads#index'
end
