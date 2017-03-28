Rails.application.routes.draw do
  root 'listings#index'
  # get "/" => "welcome#index", as: "root"

  #routes for users
  resources :users, except: [:index]

  #routes for clearance
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create, :edit, :update] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  #routes for facebook authentication - redirect from facebook after authentication
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  #routes for listings
  resources :listings, except: [:index]
end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
