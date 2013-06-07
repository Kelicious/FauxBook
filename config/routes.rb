FbClone::Application.routes.draw do
  devise_for :users

  root to: 'users#show'

  resources :users, only: [:index, :show] do
    match 'info' => 'users#info'
    match 'friends' => 'users#friends'
    match 'mutual_friends' => 'users#mutual_friends'

    resource :profile, only: [:edit]
    resources :friendships, only: [:create]
    resources :posts, only: [:create, :index]
    resources :conversations, only: [:new, :create]
  end

  resources :profiles, only: [:update] do
    resources :work_places, only: [:new]
  end

  resources :work_places, only: [:edit, :destroy, :create, :update]

  resources :friendships, only: [:update, :destroy]
  match 'friend_requests' => 'friendships#index'

  resources :posts, only: [:destroy] do
    resources :comments
    resource :like, only: [:create, :destroy]
  end

  resources :comments do
    resource :like, only: [:create, :destroy]
  end

  resources :conversations, only: [:index, :show] do
    resources :messages, only: [:create]
  end
end
