Rails.application.routes.draw do


  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  resources :users
end
