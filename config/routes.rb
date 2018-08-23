Rails.application.routes.draw do
  root 'tops#home'
  get 'tops/contact'
  get 'tops/privacy_policy'
  get 'tops/terms_of_use'
end
