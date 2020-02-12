# frozen_string_literal: true

Rails.application.routes.draw do
  delete '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  root 'events#index'
  resources :users do
    resources :events, only: %i[show]
  end
  resources :events, only: %i[index new create]
end
