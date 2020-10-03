Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :companies, only: [:index, :new, :create, :destroy]
  resources :travel_lines, only: [:index, :new, :create, :destroy]
  resources :bus_travels, only: [:index, :show, :new, :create, :destroy]
  resources :passenger_trips, only: [:show, :new, :create]
  resources :passengers, only: [:index, :show, :new, :create, :destroy]
end

# CÓDIGO ORIGINAL ANTES DE SER REFATORADO
# Rails.application.routes.draw do
#   devise_for :users
#   root to: 'bus_travels#index'

#   resources :companies, only: [:index, :new, :create] do
#     resources :travel_lines, only: [:index, :new, :create] do
#       resources :bus_travels, only: [:index, :new, :create]
#     end
#   end

#   resources :companies, only: [:destroy]
#   resources :travel_lines, only: [:destroy]
#   resources :bus_travels, only: [:destroy, :show]

#   resources :passenger_trips, only: [:show, :new, :create]

#   resources :bus_travels do
#     resources :passengers, only: [:new, :create]
#   end
#   resources :passengers, only: [:show, :destroy]
# end
