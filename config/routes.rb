Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :products, only: :show

  namespace :seller do
    resources :products
  end

  post '/populate', to: 'orders#populate', as: :populate_orders
  resources :orders, only: [:index, :update, :edit]
end
