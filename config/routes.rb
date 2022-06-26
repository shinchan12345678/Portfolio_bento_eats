Rails.application.routes.draw do
  root to: "homes#top"
  # 管理者用
  devise_for :admins, skip: [:password, :registration], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :owners, only: [:index, :destroy]
    resources :customers, only: [:index, :destroy]
  end

  # 飲食店オーナー用
  devise_for :owners, skip: [:password], controllers: {
    registrations: "owner/registrations",
    sessions: "owner/sessions"
  }
  # 飲食店オーナー側ゲストログイン機能
  devise_scope :owner do
    post 'owners/guest_sign_in', to: 'owner/sessions#guest_sign_in'
  end

  namespace :owner do
    resources :items, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :informations, only: [:new, :create, :edit, :update, :destroy]
    resource :owners, only: [:show]
    resources :coupons, only: [:index, :new, :create]
  end

  # 会員用
  devise_for :customers, skip: [:password], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  # 会員側ゲストログイン機能
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    resource :customer, only: [:show, :update]
    resources :owners, only: [:index, :show] do
      member do
        get :owner_informations
      end
    end
    resource :relationships, only: [:create, :destroy]
    resources :informations, only: [:index, :show] do
      collection do
        post :search
        get :search
      end
    end
    resources :items, only: [:show]
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    resources :coupons, only: [:index, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
