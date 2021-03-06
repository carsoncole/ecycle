Rails.application.routes.draw do
  resources :settings, :pickups, :drivers, :charges
  resources :donations, only: [:new, :create]

  root 'home#index'
  post 'deliver/:driver_id' => 'pickups#deliver', as: 'deliver'
  post 'deliver-all' => 'pickups#deliver_all', as: 'deliver_all'
  get 'about' => 'home#about', as: 'about'
  get 'thank-you' => 'donations#thank_you', as: 'thank_you'
  get 'map' => 'pickups#map', as: 'map_it'
end