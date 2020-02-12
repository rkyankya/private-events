# frozen_string_literal: true

Rails.application.routes.draw do
  delete '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  root 'users#new'
  resources :users, only: %i[show create new]
end
