Rails.application.routes.draw do
  root 'recettes#index'
  resources :recettes, only: [:index, :show]
  get "/auth/:provider/callback", to: "sessions#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
