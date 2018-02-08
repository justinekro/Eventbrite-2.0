Rails.application.routes.draw do
  get 'events/new'

  get 'events/create'

  get 'sessions/new'
  root 'users#index'
  resources :users
  resources :events

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
