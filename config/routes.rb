Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cars do
    resources :bookings, only: [:new, :create]
  end
  resources :users, only: [:show, :edit, :update]
  resources :bookings, only: [:show]
end
