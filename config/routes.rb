Rails.application.routes.draw do
  root "landing#show"
  get   "/login", to: "sessions#new"
  resources :users, only: [:new,:create] do
  end
  post  "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get   "/auth/google_oauth2/callback", to: "oauths#create"

  resource :phone_verification, only: [:new, :create]
  resources :users, only: [:new,:create]
  resources :home, only: [:index] do
    resources :repos, only: [:index, :show, :create]
  end

  get "/get_repo", to: "repos#get_repo"
  resources :account, only: [:index]
end
