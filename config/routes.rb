Rails.application.routes.draw do
  root "people#index"
  resources :people
  resources :films
  resources :planets
  resources :species
  resources :starships
  resources :vehicles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
