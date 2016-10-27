DBCPsrkl::Application.routes.draw do

  get "/standings", to: "standings#index"

  root "home#index"

  resources :calendar, only: [:index]

  resources :admin, only: [:index]
end
