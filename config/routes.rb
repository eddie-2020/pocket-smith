Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root "home#index"

  resources :groups, only: %i[index new create] do
    resources :operations, only: %i[index]
  end

  resources :operations, only: %i[new create]
end
