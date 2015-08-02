Rails.application.routes.draw do
  root 'landing#index'

  resources :countries, only: :show, param: :country_code
end
