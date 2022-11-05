Rails.application.routes.draw do
  root to: "pages#home"
  resources :bars do
    resources :bookings, only: [:new, :create]
  end
end
