# frozen_string_literal: true

Rails.application.routes.draw do
  get 'invitations/new'
  delete '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  root 'events#index'
  resources :users do
    resources :events, only: %i[show] do
    end
  end
  get '/users/:user_id/events/:event_id', to: 'invitations#new'
  post '/users/:user_id/events/:event_id', to: 'invitations#create'
  resources :events, only: %i[index new create]
end
