Rails.application.routes.draw do
  devise_for :users
  resources :sessions, only: [:new, :delete]
  root 'static_pages#home'
  match '/menu',     to: 'static_pages#menu',     via: 'get'
  match '/projects', to: 'static_pages#projects', via: 'get'
  match '/classes',  to: 'static_pages#classes',  via: 'get'
  
  resources :users, only: [:index], shallow: true do 
    resources :working_times, only: [:index, :create, :destroy]
  end

  patch 'user/:user_id/projects/:project_id/working_times/approve_all', to: 'working_times#approve_all', as: :approve_all



end
