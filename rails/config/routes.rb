Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  devise_scope :user do
    get 'auth/sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'auth/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  namespace :api do
    namespace :v1 do
      get 'me', to: 'user_info#user', as: :user
      get 'statuses/history', to: 'statuses#history', as: :statuses_history
      resources :statuses
    end
  end
end
