Rails.application.routes.draw do
  devise_for :users, path: 'u', controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: ['show', 'index'] do 
    resource :friend_request, only: ['create']
    get "friends" => "users#friends"
  end
  get "profile" => "users#show"
  get "profile/friends" => "users#friends"
  get "profile/new" => "profile#new"
  post "profile/new" => "profile#create"
  get "profile/edit" => "profile#edit"
  post "profile/edit" => "profile#update"
  get "profile/bio" => "biography#edit"
  patch "profile/bio" => "biography#update"
  resources :friend_requests, only: ['update', 'destroy']
  resources :posts, only: ['index', 'show', 'new', 'create'] do 
    resource :like, only: ['create', 'destroy']
    resources :comments, only: ['index', 'new', 'create']
  end

  root 'static_pages#home'
end
