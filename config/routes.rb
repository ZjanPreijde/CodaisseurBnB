Rails.application.routes.draw do
  resources :themes
  root to: 'pages#home'

  devise_for :users

  resources :users, only: [:show]
  resources :rooms do
     resources :bookings, only: [:create]
  end
  resources :profiles, only: [:new, :edit, :create, :update]

  namespace :api do
    resources :rooms
  end
end
