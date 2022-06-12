Rails.application.routes.draw do
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
    resources :owners, only: [:index, :show]
    resources :relationships, only: [:create, :destroy]
    resources :informations, only: [:index] do
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
