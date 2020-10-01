Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home' MUDAR PARA A PÁGINA DE INDEX DOS BUS_TRAVELS
  resources :companies, only: [:index, :new, :create] do
    resources :travel_lines, only: [:index, :new, :create] do
      resources :bus_travels, only: [:index, :new, :create]
    end
  end
  resources :companies, only: [:destroy]
  resources :travel_lines, only: [:destroy]
  resources :bus_travels, only: [:destroy]
end
