Rails.application.routes.draw do
  devise_for :users, path: 'u'
  resources :users, only: ['show'] do 
    resource :friend_request, only: ['create']
  end
  get "profile" => "users#show"
  resources :friend_requests, only: ['update']
  root 'static_pages#home'
end
