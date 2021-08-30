# frozen_string_literal: true

Rails.application.routes.draw do
  resources :doodads
  mount WorksCited::Engine => '/works_cited'
end
