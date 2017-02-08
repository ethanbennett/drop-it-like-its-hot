Rails.application.routes.draw do
  root "landing#show"
  get "/login", to: "sessions#new"
end
