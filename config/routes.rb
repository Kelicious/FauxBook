FbClone::Application.routes.draw do
  devise_for :users

  root to: 'users#show'

  resources :users, only: [:show] do
    match 'info' => 'users#info'
    resource :profile, only: [:edit]

    resources :friendships, only: [:create]
  end

  resources :profiles, only: [:update] do
    resources :work_places, only: [:new]
  end

  resources :work_places, only: [:edit, :destroy, :create, :update]

  resources :friendships, only: [:update, :destroy]
  match 'friend_requests' => 'friendships#index'
end
