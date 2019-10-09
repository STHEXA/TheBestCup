Rails.application.routes.draw do
  devise_for :users
  root 'stores#index'
  resources :users, only: [:edit, :update]
  resources :stores, only: [:new, :create, :edit, :update] do
    resources :products, only: [:index, :create]
  end
end
