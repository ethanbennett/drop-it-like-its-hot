Rails.application.routes.draw do
  root "landing#show"
  get   "/login", to: "sessions#new"
  post  "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get   "/auth/google_oauth2/callback", to: "oauths#create"

  resource :phone_verification, only: [:new, :create]
  resource :password_reset, only: [:new, :create, :edit, :update]
  resources :users, only: [:new,:create]
  resources :account, only: [:index]

  resources :home, only: [:index, :show]
  resources :repos, only: [:create, :show]
  resources :downloads, only: [:show]

end
