Rails.application.routes.draw do
  get 'static_pages/home'
  get 'home', to: 'users#show'
end
