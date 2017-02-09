Rails.application.routes.draw do
  root "landing#show"
  get   "/login", to: "sessions#new"
  post  "/login", to: "sessions#create"
  get   "/auth/google_oauth2/callback", to: "oauths#create"

  resources :users, only: [:new,:create]
  resources :home, only: [:index]

end
