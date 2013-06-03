FbClone::Application.routes.draw do
  devise_for :users

  root to: 'users#show'

  resources :users, only: [:show] do
    member do
      match 'info' => 'users#info'
    end
  end
end
