Rails.application.routes.draw do
  root 'tops#home'

  get '/contact',       to: 'tops#contact'
  get 'privacy_policy', to: 'tops#privacy_policy'
  get 'terms_of_use',   to: 'tops#terms_of_use'
  get '/signup',        to: 'users#new'
end
