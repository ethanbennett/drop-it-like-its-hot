Rails.application.routes.draw do
  root "landing#show"
<<<<<<< HEAD
  get   "/login", to: "sessions#new"
  post  "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get   "/auth/google_oauth2/callback", to: "oauths#create"
  resource :phone_verification, only: [:new, :create]
=======
  get "/account", to: "account#index"
  get   "/login", to: "sessions#new"
  post  "/logins", to: "sessions#create"

>>>>>>> 8cc4f9f135e725f89ac7b05bdc02ca7c17baf0ca
  resources :users, only: [:new,:create]
  resources :account, only: [:index]

  resources :home, only: [:index]
<<<<<<< HEAD
  resources :repos, only: [:create, :show]
  resources :downloads, only: [:show]
  # get "/get_repo", to: "repos#get_repo"
=======
  resources :account, only: [:index]
>>>>>>> 8cc4f9f135e725f89ac7b05bdc02ca7c17baf0ca
end
