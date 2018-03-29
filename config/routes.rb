Rails.application.routes.draw do

  resources :settings
  resources :drivers
  resources :pickups do
    resources :donations
  end
  root 'home#index'
  get 'donations' => 'donations#index', as: 'donations'
  post 'deliver/:driver_id' => 'pickups#deliver', as: 'deliver'
  get 'about' => 'home#about', as: 'about'
end