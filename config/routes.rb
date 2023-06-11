Rails.application.routes.draw do

  # 会員用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    # 会員情報更新
    patch 'users/:id' => 'users#update', as: 'update_user'
    # 退会確認
    get 'users/:id/confirm_withdraw' => 'users#confirm_withdraw', as: 'confirm_withdraw'
    # 退会処理（退会フラグの切替）
    patch 'users/:id/withdraw' => 'users#withdraw', as: 'withdraw'
    resources :users, only: %i[show edit]
    # 探す投稿
    patch 'find_books/:id/destroy' => 'find_books#destroy', as: 'destroy_find_book'
    patch 'find_books/:id' => 'find_books#update', as: 'update_find_book'
    resources :find_books, only: %i[new create index show edit update]
  end

  # ゲストログイン用のルーティング
  devise_scope :user do
    post 'guest_sign_in' => 'public/sessions#guest_sign_in'
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: %i[registrations passwords], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
    resources :genres, only: %i[index create edit update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
