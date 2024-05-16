Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users,    only: [:index]
  resources :subjects, only: [:index, :new, :create, :show, :destroy] do
    resources :teaching_materials, only: [:new, :create, :destroy, :edit, :update]
    resources :exams, only: [:new, :create, :destroy, :edit, :update]
  end
end
