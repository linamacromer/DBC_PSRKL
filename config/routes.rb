DBCPsrkl::Application.routes.draw do

  get "/standings", to: "standings#index"

  root "home#index"

  resources :calendar, only: [:index, :create]

  resources :admin, only: [:index]

  scope 'admin' do
    resources :competitors, only: [:new, :create, :index]
    resources :matches
  end

end
