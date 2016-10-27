DBCPsrkl::Application.routes.draw do

  get "/standings", to: "standings#index"

  root "home#index"

  resources :calendar, only: [:index, :create]

  resources :admin, only: [:index]

  scope 'admin' do
    resources :competitor, only: [:new, :create, :index]
  end

end
