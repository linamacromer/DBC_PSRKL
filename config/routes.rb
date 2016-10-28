DBCPsrkl::Application.routes.draw do

  get "/standings", to: "standings#index"

  root "home#index"

  resources :calendar, only: [:index]

  resources :admin, only: [:index]

  scope 'admin' do
    get "/login", to: "authenticate#login_form"
    post "/login", to: "authenticate#login"
    get "/logout", to: "authenticate#logout"
    get "/matches/:id/results", to: "admin#edit"
    resources :competitors, only: [:new, :create, :index]
    resources :matches
  end

end

