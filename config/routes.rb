Rails.application.routes.draw do
  # deviseのrouting
  devise_for :users

  # root path
  root to: 'prototypes#index'

  # prototype routing
  resources :prototypes, only: %i[new create show edit update destroy] do
    # comments routing
    resources :comments, only: %i[create]
  end

  # users routing
  resources :users, only: %i[show]
end
