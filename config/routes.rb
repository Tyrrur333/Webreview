Rails.application.routes.draw do
  get 'sessions/new'
  root 'tops#home'

  get '/contact',       to: 'tops#contact'
  get 'privacy_policy', to: 'tops#privacy_policy'
  get 'terms_of_use',   to: 'tops#terms_of_use'
  get '/signup',        to: 'users#new'
  post '/signup',       to: 'users#create'
  get '/login',         to: 'sessions#new'
  post '/login',        to: 'sessions#create'
  delete '/logout',     to: 'sessions#destroy'

  resources :users
end
