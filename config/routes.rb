Rails.application.routes.draw do
  devise_for :users
  resources :sessions, only: [:new, :delete]
  root 'static_pages#home'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
end
