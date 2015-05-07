Rails.application.routes.draw do
  devise_for :users
  resources :sessions, only: [:new, :delete]
  root 'static_pages#home'
  match '/menu',   to: 'static_pages#menu', via: 'get'
  match '/list',   to: 'static_pages#list', via: 'get'
#  match '/show/:id',   to: 'mypages#show',      via: 'get'
  resources :attendances, only: :show
end
