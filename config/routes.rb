Rails.application.routes.draw do
  resources :ingredients, only: %i[show new create edit update]
  resources :recipes, only: %i[show new create]
end
