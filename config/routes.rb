Rails.application.routes.draw do
  devise_for :users
  resources :sessions, only: [:new, :delete]
  root 'static_pages#home'
  match '/menu',   to: 'static_pages#menu',  via: 'get'
  match '/users',  to: 'static_pages#users', via: 'get'
#  match '/show/:id',   to: 'mypages#show',      via: 'get'
  # resources :attendances, only: [:show, :create]

  resources :users, only: [:index], shallow: true do 
    resources :working_times, only: [:index, :create]
  end
end
