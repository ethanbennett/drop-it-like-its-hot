Rails.application.routes.draw do
  root "landing#show"
  get   "/login", to: "sessions#new"
  post  "/login", to: "sessions#create"
  resources :users, only: [:new,:create]
  resources :home, only: [:index]
end
