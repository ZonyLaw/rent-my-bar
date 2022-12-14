Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bars do
    resources :bookings, only: [:new, :create, :edit, :update]
  end
    resources :bookings, only: [:index, :destroy]
end
