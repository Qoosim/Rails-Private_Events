Rails.application.routes.draw do

  root 'static_pages#home'

  get  'signup',  to: 'users#new'
  post 'signup',  to: 'users#create'
  get  'profile', to: 'users#show'

  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get  'index',   to: 'events#index'
  get  'create',  to: 'events#new'
  post 'create',  to: 'events#create'
  get  'events',  to: 'events#show'

  resources :users, only: [:new, :create, :show]
  resources :events
end
