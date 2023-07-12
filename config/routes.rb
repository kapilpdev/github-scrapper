# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  get '/show', to: 'repositories#show'
  get '/search', to: 'repositories#search'

  root 'users#index'
end
