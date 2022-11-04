Rails.application.routes.draw do
  devise_for :users, path: 'u'
  resources :users, only: ['show'] do 
    resource :friend_request, only: ['create']
    get "friends" => "users#friends"
  end
  get "profile" => "users#show"
  get "profile/friends" => "users#friends"
  resources :friend_requests, only: ['update', 'destroy']
  resources :posts, only: ['index', 'new', 'create'] do 
    resource :like, only: ['create', 'destroy']
  end

  root 'static_pages#home'
end
