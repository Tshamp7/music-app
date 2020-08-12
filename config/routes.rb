Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "sessions#new"

  resources :users
  resources :bands
  resource :session
end
