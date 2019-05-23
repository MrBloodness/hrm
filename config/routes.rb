Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }
  resources :users
  resources :employees
  resources :work_logs
  resources :work_log_types
  resources :documents
  resources :document_states
  resources :document_categories

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#home'

  get '/home', to: 'application#home', as: 'home'
  get '/secret', to: 'application#secret', as: 'secret'
  get '/about', to: 'application#about', as: 'about'
  get '/contact', to: 'application#contact', as: 'contact'
  # get '/users', to: 'users#index', as: 'users'
  # get '/users/:id', to: 'users#show', as: 'user'
  # delete '/users/:id', to: 'users#destroy'
  # get '/users/new', to: 'users#new', as: 'new_user'
end
