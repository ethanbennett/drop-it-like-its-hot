Rails.application.routes.draw do
  root "landing#show"
  get "/login", to: "sessions#new"
  resources :users, only: [:new,:create]
  resources :home, only: [:index]
end
