Rails.application.routes.draw do
  root "landing#show"
  get   "/login", to: "sessions#new"
  post  "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get   "/auth/google_oauth2/callback", to: "oauths#create"
  resources :phone_verification, only: [:new, :create]
  resources :users, only: [:new,:create]
  resources :account, only: [:index]
  resources :home, only: [:index]
  resources :downloads, only: [:show]
  resources :account, only: [:index]
end
