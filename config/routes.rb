Rails.application.routes.draw do
  root to: "bars#home"
  resources :bars do
    resources :bookings, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "bars/new", to: "bars#new"
  post "bars", to: "bars#create"
end
