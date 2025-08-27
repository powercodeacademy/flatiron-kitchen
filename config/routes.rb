Rails.application.routes.draw do
  resources :ingredients, only: %i[edit update]
end
