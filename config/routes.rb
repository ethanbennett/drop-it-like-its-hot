Rails.application.routes.draw do
  root "landing#show"
  get   "/login", to: "sessions#new"
  resources :users, only: [:new,:create]
  post  "/login", to: "sessions#create"
  get   "/auth/google_oauth2/callback", to: "oauths#create"

  resource :phone_verification, only: [:new, :create]
  resources :users, only: [:new,:create]
  resources :home, only: [:index] do
    resources :repos, only: [:index, :show, :create]
  end

  resources :account, only: [:index]
  get "/aws-test", to: "awstest#index"
end
