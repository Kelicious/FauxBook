FbClone::Application.routes.draw do
  devise_for :users

  root to: 'users#show'

  resources :users, only: [:show] do
    match 'info' => 'users#info'
  end

  resources :profiles do
    resources :work_places
  end
end
