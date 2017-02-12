Rails.application.routes.draw do
  root "landing#show"
  get   "/login", to: "sessions#new"
  resources :users, only: [:new,:create] do
    resources :repos, only: [:index, :show]
  end
  post  "/login", to: "sessions#create"
  get   "/auth/google_oauth2/callback", to: "oauths#create"

  resource :phone_verification, only: [:new, :create]
  resources :users, only: [:new,:create]
  resources :home, only: [:index]

  resources :account, only: [:index]
  get "/aws-test", to: "awstest#index"
end
