Rails.application.routes.draw do

  # 会員用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    patch 'users/:id' => 'users#update', as: 'update_user'
    delete 'users/:id' => 'users#destroy', as: 'destroy_user'
    resources :users, only: [:show, :edit]
  end

  # ゲストログイン用のルーティング
  devise_scope :user do
    post 'guest_sign_in' => 'public/sessions#guest_sign_in'
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
