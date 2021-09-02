# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  mount WorksCited::Engine => '/works_cited'
  resources :doodads
  root 'doodads#index'
end
