Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root 'tops#home'

  get 'appposts/index'
  get 'appposts/show'
  get 'appposts/new'
  get 'appposts/edit'

  get 'appposts/category_index',  to: 'appposts#category_index'

  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'


  get '/contact',       to: 'tops#contact'
  get 'privacy_policy', to: 'tops#privacy_policy'
  get 'terms_of_use',   to: 'tops#terms_of_use'
  get '/signup',        to: 'users#new'
  post '/signup',       to: 'users#create'
  get '/login',         to: 'sessions#new'
  post '/login',        to: 'sessions#create'
  delete '/logout',     to: 'sessions#destroy'



  resources :users,               only: [:show, :new, :create, :edit, :update]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :appposts,shallow: true, param: :id do
    resources :reviews
  end

  resources :appposts do
    post 'add' => 'favorites#create'
    delete '/add' => 'favorites#destroy'
  end
end
