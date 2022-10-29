Rails.application.routes.draw do
  root to: "bars#home"
  resources :users, only: [:new, :create] do
    resources :bars
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
