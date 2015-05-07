Rails.application.routes.draw do
  get 'attendance/show'

  devise_for :users
  resources :sessions, only: [:new, :delete]
  root 'static_pages#home'
  match '/menu',   to: 'static_pages#menu', via: 'get'
  match '/list',   to: 'static_pages#list', via: 'get'
#  match '/show/:id',   to: 'mypages#show',      via: 'get'
  resources :attendance, only: :show
end
