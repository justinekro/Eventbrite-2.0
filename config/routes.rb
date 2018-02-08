Rails.application.routes.draw do
  get 'sessions/new'
  root 'users#index'
  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
