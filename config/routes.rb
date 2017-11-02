Rails.application.routes.draw do
  root 'recettes#index'

  resources :recettes, only: [:index, :show]

  get "/auth/:provider/callback", to: "sessions#create", as: 'auth_callback'
  get "/auth/github", as: 'github_login'
  get "/auth/facebook", as: 'facebook_login'
  get "/auth/google_oauth2", as: 'google_login'
  post 'logout', to: 'sessions#logout', as: "logout"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
