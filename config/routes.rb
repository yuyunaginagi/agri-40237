Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users,    only: [:index, :show, :edit, :update]
  resources :subjects, only: [:index, :show, :edit, :update]
end
