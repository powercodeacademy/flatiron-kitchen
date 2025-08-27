Rails.application.routes.draw do
  resources :ingredients, only: %i[new create edit update]
end
