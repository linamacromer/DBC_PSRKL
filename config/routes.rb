DBCPsrkl::Application.routes.draw do

  get "/standings", to: "standings#index"

  root "home#index"

  resources :calendar, only: [:index]

  resources :admin, only: [:index]

  scope 'admin' do
    resources :competitors, only: [:new, :create, :index]
  end

end
