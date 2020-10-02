Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: 'bus_travels#index', as: :authenticated_root
    end
    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :companies, only: [:index, :new, :create] do
    resources :travel_lines, only: [:index, :new, :create] do
      resources :bus_travels, only: [:index, :new, :create]
    end
  end

  resources :companies, only: [:destroy]
  resources :travel_lines, only: [:destroy]
  resources :bus_travels, only: [:destroy]

  # CÓDIGO ORIGINAL ANTES DE TENTAR CORRIGIR FORMULÁRIO DE PASSENGER_TRIPS
  resources :bus_travels do
    resources :passenger_trips, only: [:show, :new, :create]
  end

  #CÓDIGO SECUNDÁRIO PARA TENTAR NESTING EM TRAVEL_LINES E SUBSEQUENTES
  # resources :travel_lines do
  #   resources :bus_travels do
  #     resources :passenger_trips, only: [:show, :new, :create]
  #   end
  # end

  resources :passengers, only: [:show, :new, :create, :destroy]
end
