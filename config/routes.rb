Rails.application.routes.draw do
  namespace :public do
    get 'customers/show'
  end
  root to: "homes#top"

  # 飲食店オーナー用
  devise_for :owners, skip: [:password], controllers: {
    registrations: "owner/registrations",
    sessions: "owner/sessions"
  }

  namespace :owner do
    resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :informations, only: [:new, :create]
  end

  # 会員用
  devise_for :customers, skip: [:password], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    resource :customer, only: [:show, :update]
    resources :owners, only: [:index, :show] do
      member do
        get :owner_informations
      end
    end
    resources :relationships, only: [:create, :destroy]
    resources :informations, only: [:index,:show] do
      collection do
        post :search
      end
    end
    resources :items, only: [:show]
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
