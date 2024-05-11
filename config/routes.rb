Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users,    only: [:index]
  resources :subjects, only: [:index, :new, :create, :show, :edit, :update] do
    resources :teaching_materials, only: [:new, :create, :show, :destroy]
  end
end
