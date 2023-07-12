Rails.application.routes.draw do
  resources :users
  get '/search', to: 'repositories#search'
end
