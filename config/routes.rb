Rails.application.routes.draw do
  devise_for :users, path: 'u'
  resources :users, only: ['show']
  root 'static_pages#home'
end
