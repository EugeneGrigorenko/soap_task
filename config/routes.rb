Rails.application.routes.draw do
  devise_for :users
  root 'landing#index'

  resources :countries, only: :show, param: :country_code
  resources :currencies, only: [:index, :show]
  resources :countries_users_relations, only: :create do
    delete ':country_id', to: 'countries_users_relations#destroy', on: :collection
  end
  resources :trips, only: [:new, :create, :index]
end
