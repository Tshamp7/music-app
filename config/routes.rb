Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "sessions#new"

  resources :users

  resources :bands do 
    resources :albums, only: [:new, :index]
  end

  resource :session
  resources :albums do
    resources :tracks, only: [:new, :index]
  end

  resources :tracks
end
