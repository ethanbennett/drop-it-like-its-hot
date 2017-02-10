Rails.application.routes.draw do
  root "landing#show"
  get   "/login", to: "sessions#new"
  post  "/logins", to: "sessions#create"
  resources :users, only: [:new,:create]
  resources :home, only: [:index]
  resources :account, only: [:index]
  get "/aws-test", to: "awstest#index"
end
