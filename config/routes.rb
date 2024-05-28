Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users,    only: [:index]   # ユーザー登録は管理者側から行うため、ユーザー側にはユーザー一覧の取得機能しかついてない
  resources :subjects, only: [:index, :new, :create, :show, :destroy] do
    resources :teaching_materials, only: [:new, :create, :destroy, :edit, :update]
    resources :exams, only: [:new, :create, :destroy, :edit, :update]
    resources :questions, only: [:create, :destroy]
  end
end
