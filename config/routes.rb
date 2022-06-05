Rails.application.routes.draw do
  # 飲食店オーナー用
  devise_for :owners,skip: [:password],controllers: {
    registrations: "owner/registrations",
    sessions: "owner/sessions"
  }

  # 会員用
  devise_for :customers,skip: [:password],controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
