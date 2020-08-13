Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "sessions#new"

  resources :users

  resources :bands do 
    resources :albums
  end

  resource :session
  resources :albums, except: :new
end
